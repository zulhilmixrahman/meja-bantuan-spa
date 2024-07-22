$(document).ready(function () {
    $('.display-password').click(function (){
        if($(this).hasClass('fa-solid')){
            $(this).siblings('.input-password').attr('type', 'text');
            $(this).removeClass('fa-solid').addClass('fa-regular');
        } else {
            $(this).siblings('.input-password').attr('type', 'password');
            $(this).removeClass('fa-regular').addClass('fa-solid');
        }
    });
});
