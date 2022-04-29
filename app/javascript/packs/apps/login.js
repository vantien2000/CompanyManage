$(document).ready(function() {
	$("#form-login").validate({
		rules: {
		  "email": {
			required: true,
			maxlength: 256,
			vaidateEmail: true,
		  },
		  "password": {
			required: true,
			maxlength: 256
		  },
		},
		messages: {
		  "password": {
			required: "Password is require",
			maxlength: "Your password must be at least 256 characters long"
		  },
		  "email": {
			required: "Email is require",
			maxlength: "Your Email must be at least 256 characters long",
			validateEmail: "Please enter a valid email address"
		  }
		},
		submitHandler: function(form) {
		  form.submit();
		}
	 });

	$.validator.addMethod("validateEmail", function (value, element) {
		return this.optional(element) || /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(value);
	}, "Please enter a valid email address");
})