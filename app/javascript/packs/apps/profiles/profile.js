import "./register";
import "./modal";
import "./management";
import "./details";
import "./validate";

$(document).ready(function () {
    disableCopyPaste('#company-management-frm');
    disableCopyPaste('#company-register-frm');
    disableCopyPaste('#company-details-frm');
    function disableCopyPaste (selector) {
        $(selector).on('copy paste', function(e) {
            e.preventDefault();
        })
    }
})