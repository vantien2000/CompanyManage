$(document).ready(function() {
    $('.group-btn-status, .group-btn').on('click', 'button', function(e) {
        e.preventDefault();
        $('.modal').addClass('d-flex');
        $('.modal-background').addClass('d-block');
        if ($(this).parent().parent().hasClass('group-btn-status')) {
            $('#form_value').val(JSON.stringify({status : $(this).data('status'), code : $(this).data('company-code')}));
            $('.text-confirm-status').text('change status these Company?');
        }
        if ($(this).parent().parent().hasClass('group-btn')) {
            data = { type: 'update' };
            $('#form_value').val(JSON.stringify(data));
            $('.text-confirm-status').text('update these Company?');
        }
    });
    $('.btn-cancel-alert').on('click', function(e) {
        $('.modal').removeClass('d-flex');
        $('.modal-background').removeClass('d-block');
    });
    let status = $('#status_after_post').val();
    if (status === 'success') {
        $('.modal-background').addClass('d-block');
        $('.modal').addClass('d-flex');
        $('#alert_form').addClass('d-none');
        $('#alert_success').removeClass('d-none');
    }
})