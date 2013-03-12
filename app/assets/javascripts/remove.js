$(function() {
  return $("a[data-method='delete']").on("ajax:success", function() {
    $(this).parent().remove();  //WHAT should happen for the user to SEE!
  });
});
