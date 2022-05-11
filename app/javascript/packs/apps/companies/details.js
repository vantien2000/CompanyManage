$(document).ready(function() {
    $('.btn-sbm-alert').on('click', function(e) {
        e.preventDefault();
        var _form_value = $('#form_value').val();
        console.log(_form_value != 'update');
        if (_form_value != 'update') {
            $('#alert_form').trigger('submit');
        }
        else {
            $('#company-details-frm').trigger('submit');
        }
    });
});