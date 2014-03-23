$ ->
  SourceList = flight.component ->
    @defaultAttrs
      voteTrigger: 'voteOccured'

    @after 'initialize', ->
      @on document, @attr.voteTrigger, @maybeReorderSources

    @maybeReorderSources = (ev, data) ->
      console.log 'vote event : ' + data

  SourceList.attachTo '.js-topic-source-list'
