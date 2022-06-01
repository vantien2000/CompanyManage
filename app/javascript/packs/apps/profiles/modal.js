$(document).ready(function() {
    $('.profile-group-btn-status, .profile-group-btn').on('click', 'button', function(e) {
        e.preventDefault();
        $('.modal').addClass('d-flex');
        $('#profile_alert_form').removeClass('d-none');
        $('#profile_alert_success').addClass('d-none');
        $('.modal-background').addClass('d-block');
        if ($(this).parent().parent().hasClass('profile-group-btn-status')) {
            $('#form_value').val($(this).data('status'));
            $('#code_value').val($(this).data('code'));
            $('#profile_alert_form').attr('action', $(this).data('url-status-update'));
            $('.text-confirm-status').text('change status these Profile?');
        }
        if ($(this).parent().parent().hasClass('profile-group-btn')) {
            $('#profile_alert_form').attr('action', '');
            $('#form_value').val('update');
            $('.text-confirm-status').text('update these Profile?');
        }
    });
    $(document).on('click','.profile-btn-cancel-alert , .profile-btn-close-alert', function(e) {
        $('#status_after_post').val('');
        $('.modal').removeClass('d-flex');
        $('.modal-background').removeClass('d-block');
    });
    let status = $('#status_after_post').val();
    if (status == 'success') {
        $('.modal-background').addClass('d-block');
        $('.modal').addClass('d-flex');
        $('#profile_alert_form').addClass('d-none');
        $('#profile_alert_success').removeClass('d-none');
    }
})