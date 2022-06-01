$(document).ready(function() {
    $('.group-btn-status, .group-btn').on('click', 'button', function(e) {
        e.preventDefault();
        $('.modal').addClass('d-flex');
        $('#alert_form').removeClass('d-none');
        $('#alert_success').addClass('d-none');
        $('.modal-background').addClass('d-block');
        if ($(this).parent().parent().hasClass('group-btn-status')) {
            $('#form_value').val($(this).data('status'));
            $('#code_value').val($(this).data('code'));
            $('#alert_form').attr('action', $(this).data('url-status-update'));
            $('.text-confirm-status').text('change status these Company?');
        }
        if ($(this).parent().parent().hasClass('group-btn')) {
            $('#alert_form').attr('action', '');
            $('#form_value').val('update');
            $('.text-confirm-status').text('update these Company?');
        }
    });
    $(document).on('click','.btn-cancel-alert , .btn-close-alert', function(e) {
        $('#status_after_post').val('');
        $('.modal').removeClass('d-flex');
        $('.modal-background').removeClass('d-block');
    });
    let status = $('#status_after_post').val();
    if (status == 'success') {
        $('.modal-background').addClass('d-block');
        $('.modal').addClass('d-flex');
        $('#alert_form').addClass('d-none');
        $('#alert_success').removeClass('d-none');
    }
})