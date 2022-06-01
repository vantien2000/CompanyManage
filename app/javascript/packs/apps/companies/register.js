$(document).ready(function(){
  keyUpInput('code', 6);
  keyUpInput('company_company_name', 256);
  keyUpInput('company_address', 256);
  keyUpInput('company_email', 256);
  keyUpInput('company_phone_number', 10);
  fixNumberForInput('company_phone_number');
  keyUpInput('comapny_website', 255);
  
  function keyUpInput(selector, max) {
    $('#'+selector).on('keypress', function(e) {
      lengtStr = $(this).val().length;
      if (lengtStr == max) {
        return false;
      }
      return true;
    });
  }
  function fixNumberForInput(selector) {
    $('#'+selector).on('keypress', function(e) {
        var key = window.event ? e.keyCode : e.which;
        if (key === 8 || key === 46) {
            return true;
        } else if ( key < 48 || key > 57 ) {
            return false;
        } else {
            return true;
        }
    });
  };
  //priview image
  $('#company_logo').on('change', function(e) {
    $('.logo-img').attr('src', URL.createObjectURL(e.target.files[0]))
  });
})