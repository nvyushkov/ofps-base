$('.edit_ipv').ready(function(){
    $('.ippv_check:checkbox').addClass('unchecked')
    $('.ippv_check:checked').removeClass('unchecked').addClass('checked');


    $('input').hasClass('checked') ?
        $('.ippv_check.unchecked').attr('disabled', true)
        : false

    $('.ippv_check:checkbox').change(function(){
        $(this).toggleClass('checked unchecked')
        $(this).prop('checked') ?
            $('.unchecked').attr('disabled', true)
            :
            $('.ippv_check:checkbox').attr('disabled', false)
    })
});
