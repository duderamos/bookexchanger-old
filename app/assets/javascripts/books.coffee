$(document).ready ->
  $('#getgooglebooks').click ->
    isbn = $('#book_isbn').val()
    if isbn == ''
      alert 'ISBN cannot be empty'
      return
    $.getJSON 'https://www.googleapis.com/books/v1/volumes?q=isbn:' + isbn, (response) ->
      if response.totalItems == 0
        alert 'No book found'
        return
      $('#book_title').val response.items[0].volumeInfo.title
      $('#book_authors').val response.items[0].volumeInfo.authors[0]
      $('#book_publisher').val response.items[0].volumeInfo.publisher
      $('#book_published_date').val response.items[0].volumeInfo.publishedDate
      $('#book_language').val response.items[0].volumeInfo.language
      $('#book_pages').val response.items[0].volumeInfo.pageCount
      return
    return
  return
