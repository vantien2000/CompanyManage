$(document).ready(function () {
  $("#company-register-frm").validate({
    rules: {
      "code": {
        required: true,
        validateCode: true
      },
      "company_name": {
        required: true,
        maxlength: 256
      },
      "address": {
        required: true,
        maxlength: 256
      },
      "email": {
        required: true,
        maxlength: 256,
        vaidateEmail: true,
      },
      "phone_number": {
        required: true,
        validatePhone: true
      },
      "website": {
        maxlength: 256
      },
      "logo_image" : {
        required: true
      }
    },
    messages: {
      "code": {
        required: "Code is required",
        validateCode: "Please enter a valid Code",
      },
      "company_name": {
        required: "Company name is required",
        maxlength: "Company name be at least 256 characters long",
      },
      "address": {
        required: "Address name is required",
        maxlength: "Address be at least 256 characters long"
      },
      "email": {
        required: "Email is required",
        maxlength: "Your Email must be at least 256 characters long",
        validateEmail: "Please enter a valid email address"
      },
      "phone_number": {
        required: "Phone number is required",
        validatePhone: "Please enter a valid phone number"
      },
      "website": {
        maxlength: "Website be at least 256 characters long"
      },
      "logo_image" : {
        required: "Logo image is required"
      }
    },

    submitHandler: function (form) {
      form.submit();
    }
  });

  $.validator.addMethod("validateEmail", function (value, element) {
    return this.optional(element) || /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(value);
  });
  $.validator.addMethod("validatePhone", function (value, element) {
    return this.optional(element) || /(84|0[3|5|7|8|9])+([0-9]{9})\b/g.test(value);
  });
  $.validator.addMethod("validateCode", function (value, element) {
    return this.optional(element) || /^([A-Za-z]|[0-9]){6}$/i.test(value);
  });
});