require 'googlebooks'

class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sources
  # GET /sources.json
  def index
    @sources = Source.all
  end

  # GET /sources/1
  # GET /sources/1.json
  def show
  end

  # GET /sources/new
  def new
    @source = Source.new
  end

  # GET /sources/1/edit
  def edit
  end

  # POST /topics/1/sources/1/upvote
  def upvote
    topic_source = TopicSource.find_by(:topic_id => params[:topic_id],
                                       :source_id => params[:id])
    topic_source.votes.create
    redirect_to topic_source.topic
  end

  # GET /sources/search
  def search
    title_query = params[:title_query]
    g_sources = GoogleBooks.search(title_query, { :projection => 'lite', :count => 5 }).map do |b|
      {
        :title => b.title,
        :isbn => b.isbn,
        :google_external_id => b.id,
        :authors => b.authors,
        :image => b.image_link,
      }
    end

    render :json => g_sources
  end

  # POST /topics/1/sources
  # POST /topics/1/sources.json
  def create
    @source = Source.new_from_google_books(source_params[:google_external_id])
    # TODO error if no topic_id
    @topic = Topic.find(params[:topic_id])
    # TODO add source to Topic
    if @source.save && @topic
      @topic.sources << @source
      render :json => @source
    else
      render :json => @source.errors, :status => :unprocessable_entity
    end
  end

  # PATCH/PUT /sources/1
  # PATCH/PUT /sources/1.json
  def update
    respond_to do |format|
      if @source.update(source_params)
        format.html { redirect_to @source, :notice => 'Source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => 'edit' }
        format.json { render :json => @source.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    @source.destroy
    respond_to do |format|
      format.html { redirect_to sources_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      @source = Source.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_params
      params.require(:source).permit(:google_external_id)
    end
end
