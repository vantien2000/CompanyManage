$(document).ready(function(){
  $('#company-register-frm').off().on('submit' ,function(e){
    if ($('#logo_image').text() == "") {
      $('#error_image').text("Logo image is required");
      return false;
    }
    $(this).trigger('submit');
  });
  $('#company_logo').on('change', function(e) {
    $('.logo-img').attr('src', URL.createObjectURL(e.target.files[0]));
    $('#logo_image').val(image_name);
    let image_name = e.target.files[0].name;
    let regex = /.*\.(gif|jpeg|bmp|webp|svg|jpg|png)$/igm;
    $('#error_image').text('');
    if (!regex.test(image_name)) {
      $('#error_image').text('Please enter a valid image');
      return false;
    } else {
      $('#error_image').text('');
      return true;
    }
  });
})