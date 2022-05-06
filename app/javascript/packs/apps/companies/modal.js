$(document).ready(function() {
    $('.modal').hide();
    $('.modal-background').hide();
    $('.group-btn-status, .group-btn').on('click', 'button', function(e) {
        e.preventDefault();
        $('.modal').show();
        $('.modal-background').show();
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
    $('.modal .btn-cancel-alert').on('click', function(e) {
        $('.modal').hide();
        $('.modal-background').hide();
    });
    let status = $('#status_after_post').val();
    console.log(status);
    if (status == 'success') {
        $('.modal-background').css('display','block');
        $('.modal').css('display','flex');
        $('#alert_form').addClass('d-none');
        $('#alert_success').removeClass('d-none');
    }
})