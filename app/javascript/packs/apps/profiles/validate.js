$(document).ready(function() {
  $("#profile-register-frm").validate({
    rules: {
      "profile[company_name]": {
        required: true,
        maxlength: 256
      },
      "profile[address]": {
        required: true,
        maxlength: 256
      },
      "profile[email]": {
        required: true,
        maxlength: 256,
        validateEmail: true,
      },
      "profile[phone_number]": {
        required: true,
        validatePhone: true
      },
      "profile[website]": {
        maxlength: 256
      },
      "profile[logo]": {
        required: true,
        accept: "jpeg|png|jpg|gif|webp|bmp|svg",
      }
    },
    messages: {
      "profile[company_name]": {
        required: "Company name is required",
        maxlength: "Company name be at least 256 characters long",
      },
      "profile[address]": {
        required: "Address name is required",
        maxlength: "Address be at least 256 characters long"
      },
      "profile[email]": {
        required: "Email is required",
        maxlength: "Your Email must be at least 256 characters long",
        validateEmail: "Please enter a valid email address"
      },
      "profile[phone_number]": {
        required: "Phone number is required",
        validatePhone: "Please enter a valid phone number"
      },
      "profile[website]": {
        maxlength: "Website be at least 256 characters long"
      },
      "profile[logo]": {
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
  $.validator.addMethod('filesize', function(value, element, param) {
    return this.optional(element) || (element.files[0].size <= param);
  });
});