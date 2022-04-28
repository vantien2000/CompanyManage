$(document).ready(function(){
    $('#upload').on('change', function(e) {
        let image_name = e.target.files[0].name;
      $('.logo-img').attr('src', URL.createObjectURL(e.target.files[0]));
      $('#logo_image').val(image_name);
      let regex = /.*\.(gif|jpeg|bmp|webp|svg|jpg|png)$/igm;
      $('#error_image').text('');
      if (!regex.test(image_name)) {
        $('#error_image').text('Please enter a valid image');
      } else {
        $('#error_image').text('');
      }
    });
})