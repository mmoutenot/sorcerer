$ ->
  SourceAdd = flight.component ->
    @defaultAttrs
      submitButtonSelector: '.js-submit'
      submitUrl: '/topics/1/sources'

    @after 'initialize', ->
      @on @attr.submitButtonSelector, 'click', @submit

    @submit = ->
      $.ajax
        type: 'post'
        url: @attr.submitUrl
        data:
          source:
            # TODO, use real isbn
            isbn: '9781845114220'
        success: (data) =>
          console.log 'source created: ' + data

  SourceAdd.attachTo '.js-source-add'
