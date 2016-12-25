Makeitsnappy = {}

Makeitsnappy.autoSelectSearch = ->
  window.onload = ->
    keyword = document.getElementById 'keyword'
    keyword.onclick = ->
      @value = ""
    keyword.onblur = ->
      @value = "search"

Makeitsnappy.autoSelectSearch()