$(document).ready(function () {
  $('.show-limit').on('change', function(){
    $(this).closest('form').trigger('submit');
    $('.btn-submit').trigger('click');
  });
})
