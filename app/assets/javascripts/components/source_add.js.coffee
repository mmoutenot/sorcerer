$ ->
  SourceAdd = flight.component ->
    @defaultAttrs
      # submitButtonSelector: '.js-submit'
      searchPath: '/sources/search?title_query=%QUERY'

      typeaheadSelector: '.typeahead'
      typeaheadName: 'source-comp'
      displayKey: 'title'
      typeaheadSelectEvent: 'typeahead:selected'


    @setupTypeahead = ->
      sources_comp = new Bloodhound
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace 'value'
        queryTokenizer: Bloodhound.tokenizers.whitespace
        prefetch: ''
        remote: @attr.searchPath

      sources_comp.initialize()

      @select('typeaheadSelector').typeahead null,
        name: @attr.typeaheadName
        displayKey: @attr.displayKey
        source: sources_comp.ttAdapter()

    @submit = (e, obj, c) ->
      data = 'source':
        'google_external_id': obj.google_external_id

      $.ajax
        type: 'POST'
        url: @$node.attr('data-href')
        data: data
        success: (data) =>
          console.log 'source created: ' + data

    @after 'initialize', ->
      @setupTypeahead()
      # @on @attr.submitButtonSelector, 'click', @submit
      @on @attr.typeaheadSelectEvent, @submit

  SourceAdd.attachTo '.js-source-add'
