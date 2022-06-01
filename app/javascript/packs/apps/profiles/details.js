$(document).ready(function() {
    $('#profile_alert_form .profile-btn-sbm-alert').on('click', function(e) {
        e.preventDefault();
        var _form_value = $('#form_value').val();
        console.log(_form_value != 'update');
        if (_form_value != 'update') {
            $('#profile_alert_form').trigger('submit');
        }
        else {
            $('#profile-details-frm').trigger('submit');
        }
    });
});