$(document).ready(
  function()
  {
    var search_patron_box = $("#search_patron");

    search_patron_box.data('oldVal', search_patron_box.val());

    search_patron_box.bind('propertychange keyup input paste', function(event){
      if(search_patron_box.data('oldVal') != search_patron_box.val()) {
        $('.patron_search_box form').submit();
      }
    });


    var search_books_box = $("#search_books");

    search_books_box.data('oldVal', search_books_box.val());

    search_books_box.bind('propertychange keyup input paste', function(event){
      if(search_books_box.data('oldVal') != search_books_box.val()) {
        $('.book_search_box form').submit();
      }
    });
  }
);
