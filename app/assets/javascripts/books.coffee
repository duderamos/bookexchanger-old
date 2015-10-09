ready = ->
  $('#getgooglebooks').click ->
    isbn = $('#book_isbn').val()

    if isbn is ''
      alert 'ISBN cannot be empty'
    else
      $.getJSON 'https://www.googleapis.com/books/v1/volumes?q=isbn:' + isbn, (response) ->
        if response.totalItems == 0
          alert 'No book found'
        else
          volumeInfo = response.items[0].volumeInfo

          $('#book_title').val            volumeInfo.title
          $('#book_authors').val          volumeInfo.authors[0]
          $('#book_publisher').val        volumeInfo.publisher
          $('#book_published_date').val   volumeInfo.publishedDate
          $('#book_language').val         volumeInfo.language
          $('#book_pages').val            volumeInfo.pageCount
          $('#book_cover').prop           'disabled', true
          $('#book_remote_cover_url').val volumeInfo.imageLinks.thumbnail 
          $('#cover-image').html          ('<img src="' + volumeInfo.imageLinks.thumbnail + '"/>')

$(document).ready ready
$(document).on 'page:load', ready

window.myConfirmBox = (message, callback) ->
  bootbox.dialog
    message: message
    class: 'class-confirm-box'
    className: 'my-modal'
    buttons:
      success:
        label: 'Yes'
        className: 'btn-danger'
        callback: -> callback()
      fail:
        label: 'No'
        className: 'btn-success'

$.rails.allowAction = (link) ->
  message = link.data('confirm')
  return true unless message

  answer = false
  callback = undefined

  if $.rails.fire(link, 'confirm')
    myConfirmBox message, ->
      callback = $.rails.fire(link, 'confirm:complete', [answer])
      if callback
        oldAllowAction = $.rails.allowAction
        $.rails.allowAction = ->
          true
        link.trigger 'click'
        $.rails.allowAction = oldAllowAction
  false
