$(document).ready(function() {
    $('.btn-sbm-alert').on('click', function(e) {
        e.preventDefault();
        var _form_value = $('#form_value').val();
        let value = JSON.parse(_form_value);
        if (value.status != undefined) {
            postEditCompany(value);
        }
        if (value.type != undefined) {
            $('#company-details-frm').trigger('submit');
        }
    });

    $('.btn-close-alert').on('click', function(e) {
        location.href = '/companies';
    })

    function postEditCompany(data) {
        var _action = '/companies/status/';
        var _data = data;
        $.ajax({
            type: 'post',
            url: location.origin + _action,
            data: _data,
            success: function (res) {
                $('#alert_form').addClass('d-none');
                $('#alert_success').removeClass('d-none');
            }
        })
    }
})