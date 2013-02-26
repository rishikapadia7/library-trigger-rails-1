function alerter()
{
  alert("I am working!");
}

function removeDuplicate() {
  var books_search_div = $('.book_search_results');
  var books_selected = $(".selected_books");
  books_search_div.find("p").each(function(i,element) {
      books_selected.find("p").each(function(index, node) {
          if($(node).find("input:checkbox").prop("id") == $(element).find("input:checkbox").prop("id")) {
            $(element).remove();
          }
        }
      );
    }
  );
}

$(document).ready(
  function() {
    var search_patron_box = $("#search_patron");
    var books_search_div = $('.book_search_results');
    var books_selected = $(".selected_books");
    var patron_search_div = $('.patron_search_results');

    search_patron_box.data('oldVal', search_patron_box.val());

    search_patron_box.bind('propertychange keyup input paste', function(event){
      if(search_patron_box.data('oldVal') != search_patron_box.val()) {
        if(search_patron_box.val().length > 2) {
          $('.patron_search_box form').submit();
        }
      }
    });

    patron_search_div.on("change", "input:radio", function(event) {
        patron_search_div.find('input:submit').attr("disabled",false);
      }
    );


    var search_books_box = $("#search_books");
    var books_array = new Array;

    search_books_box.data('oldVal', search_books_box.val());

    search_books_box.bind('propertychange keyup input paste', function(event){
      if(search_books_box.data('oldVal') != search_books_box.val()) {
        if(search_books_box.val().length > 2) {
          $('.book_search_box form').submit();
        }
      }
    });


    books_search_div.on("change", "input:checkbox", function(event) {
        var books = books_search_div.find("input:checkbox");
        var current_book = $(this);
        var exists = false;

        if($(this).prop("checked")) {
          books_array.push($(this).attr("id").substring(6));
          $(".selected_books p").each(function(i, element) {
              if(current_book.attr("id") == $($(element).children().get(0)).attr("id")) {
                exists = true;
              }
            }
          );
          if(!exists) {
            $(".selected_books").find('form').prepend(current_book.parent());
          }
        }
      }
    );

    function checkCheckboxes() {
      var books = books_selected.find("input:checkbox");
      if(books.filter(':checked').length > 0) {
        books_selected.find('input:submit').attr("disabled",false);
      }
      else {
        books_selected.find('input:submit').attr("disabled",true);
      }
    }

    setInterval(checkCheckboxes, 33);
  }
);
