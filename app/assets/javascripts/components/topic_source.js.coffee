$ ->
  TopicSource = flight.component ->
    @defaultAttrs
      voteCountSelector: '.js-topic-source-vote-count'
      voteSelector: '.js-topic-source-voter'
      voteTrigger: 'voteOccured'

    @after 'initialize', ->
      @$voter = @select 'voteSelector'
      voterIdSelector = '#' + @$voter.attr('id')
      @on voterIdSelector, 'click', @upVote

    @upVote = ->
      $.ajax
        type: "POST"
        url: @$voter.attr 'href'
        success: =>
          $voteCount = @select 'voteCountSelector'
          $voteCount.text(+$voteCount.text() + 1)
          console.log 'triggering vote event'
          @trigger document, @attr.voteTrigger,
            sourceId: @$node.attr('id')

  TopicSource.attachTo '.js-topic-source'
