$(document).ready(function() {
  $("#company-register-frm").validate({
    rules: {
      "company[code]": {
        required: true,
        validateCode: true,
        maxlength: 6,
        minlength: 6
      },
      "company[company_name]": {
        required: true,
        maxlength: 256
      },
      "company[address]": {
        required: true,
        maxlength: 256
      },
      "company[email]": {
        required: true,
        maxlength: 256,
        validateEmail: true,
      },
      "company[phone_number]": {
        required: true,
        validatePhone: true
      },
      "company[website]": {
        maxlength: 256
      },
      "company[logo]": {
        required: true,
        accept: "jpeg|png|jpg|gif|webp|bmp|svg",
      }
    },
    messages: {
      "company[code]": {
        required: "Code is required",
        validateCode: "Please enter a valid Code",
        maxlength: "Code should be 6 charecter",
        minlength: "Code should be 6 charecter"
      },
      "company[company_name]": {
        required: "Company name is required",
        maxlength: "Company name be at least 256 characters long",
      },
      "company[address]": {
        required: "Address name is required",
        maxlength: "Address be at least 256 characters long"
      },
      "company[email]": {
        required: "Email is required",
        maxlength: "Your Email must be at least 256 characters long",
        validateEmail: "Please enter a valid email address"
      },
      "company[phone_number]": {
        required: "Phone number is required",
        validatePhone: "Please enter a valid phone number"
      },
      "company[website]": {
        maxlength: "Website be at least 256 characters long"
      },
      "company[logo]": {
        required: "Logo is required",
        accept: "Logo must be JPEG, PNG, SVG, WEBP, BMP, JPG, GIF",
        filesize: "Logo souble be less than 1MB"
      }
    },
    submitHandler: function (form) {
      form.submit();
    }
  });

  $.validator.addMethod("validateEmail", function (value, element) {
    return this.optional(element) || /^[\w+\-.]{2,}@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+$/iu.test(value);
  });
  $.validator.addMethod("validatePhone", function (value, element) {
    return this.optional(element) || /(84|0[3|5|7|8|9])+([0-9]{8})\b/gu.test(value);
  });
  $.validator.addMethod("validateCode", function (value, element) {
    return this.optional(element) || /(\w+[0-9]+)|([0-9]+\w+)/iu.test(value);
  });
  $.validator.addMethod('filesize', function(value, element, param) {
    return this.optional(element) || (element.files[0].size <= param);
  });
});