# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  sources_comp = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace 'value'
    queryTokenizer: Bloodhound.tokenizers.whitespace
    prefetch: ''
    remote: '/sources/search?title_query=%QUERY'
  )

  sources_comp.initialize()

  $('#source-add .typeahead').typeahead(null,
    name: 'sources-comp'
    displayKey: 'title'
    source: sources_comp.ttAdapter()
  )
