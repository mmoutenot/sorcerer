$ ->
  Voter = flight.component ->
    @defaultAttrs
      voteCountSelector: '.js-topic-source-vote-count'

    @after 'initialize', ->
      @on 'click', @upVote

    @upVote = ->
      $.ajax
        type: "POST"
        url: @$node.attr('href')
        success: =>
          $voteCount = @select 'voteCountSelector'
          $voteCount.text(+$voteCount.text() + 1)

  Voter.attachTo '.js-topic-source-vote'
