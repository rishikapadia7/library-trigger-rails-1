$(document).ready(
  function()
  {
    enableSubmitAfterSelect(".patron_search_results"," input:radio");
    enableSubmitAfterSelect(".book_search_results","input:checkbox");
  }
);

function enableSubmitAfterSelect(form_class_name, input_type)
{
  var selector = (form_class_name + ' ' + input_type);
  $(selector).change(
    function()
    {
      if($(form_class_name).find("input:submit").attr('disabled'))
      {
        $(form_class_name).find("input:submit").attr('disabled',false);
      }
    }
  );
}
