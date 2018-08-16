$(document).ready(function() {
  $('.select-book').select2({
    theme: 'bootstrap'
  });

  if ($('textarea').length > 0) {
    var data = $('.ckeditor');
    $.each(data, function(i) {
      CKEDITOR.replace(data[i].id)
    });
  }

  CKEDITOR.config.height = 500;
});
