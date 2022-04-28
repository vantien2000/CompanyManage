$(document).ready(function(){
    $('#form_per_page').on('change', '#per_page', function(e) {
        $('#form_per_page').submit();
    });
})