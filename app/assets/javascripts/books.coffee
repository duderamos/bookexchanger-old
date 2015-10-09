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
