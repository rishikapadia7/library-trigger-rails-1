$(document).ready(
  function()
  {
    $(".patron_search_results form input:radio").change( function()
      {
        $(".patron_search_results input:submit").removeAttr('disabled');
      }
    );
  }
);
