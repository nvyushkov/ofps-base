//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){
    $('#tabs div:not(:first)').hide();
    $('#tabs-nav li').click(function(event) {
        event.preventDefault();
        $('#tabs div').hide();
        $('#tabs-nav .current').removeClass("current");
        $(this).addClass('current');

        var clicked = $(this).find('a:first').attr('href');
        $('#tabs ' + clicked).show('1000');
    }).eq(0).addClass('current');
})
$('table').ready(function() {
    $('tbody > tr').addClass('tr');
    $empty_notice = $('#notice').html();
    if (isNaN($empty_notice)) {
        $('#notice').animate({
            color: "transparent"
        }, 3200)
    }
    $('.tr').click(function(){
        $('.tr').removeClass('selected');
        $(this).toggleClass('selected')
    });
    $(".datepicker").datepicker(
        {
            dateFormat: 'dd.mm.y',
            buttonImage: "/assets/datePicker.gif",
            showOn: "button",
            buttonImageOnly: true,
            monthNames: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
            monthNamesShort: ['Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн', 'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек'],
            dayNames: ['воскресенье', 'понедельник', 'вторник', 'среда', 'четверг', 'пятница', 'суббота'],
            dayNamesShort: ['вск', 'пнд', 'втр', 'срд', 'чтв', 'птн', 'сбт'],
            dayNamesMin: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб']
        });
    $(".datepickerker_to").datepicker(
        {
            dateFormat: 'dd.mm.y',
            buttonImage: "/assets/datePicker.gif",
            showOn: "button",
            buttonImageOnly: true,
            monthNames: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
            monthNamesShort: ['Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн', 'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек'],
            dayNames: ['воскресенье', 'понедельник', 'вторник', 'среда', 'четверг', 'пятница', 'суббота'],
            dayNamesShort: ['вск', 'пнд', 'втр', 'срд', 'чтв', 'птн', 'сбт'],
            dayNamesMin: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб']
        });
    $('#how_much').html("Количество элементов: " + "<span>"+$("tbody > tr").length+"</span>");
    $('.address_input').on('change', TableFilter.address);
    $('.tech_input').on('change', TableFilter.technic);
    $('.pch_input').on('change', TableFilter.pch);
    $('.gdzs_input').change(TableFilter.gdzs);
    $('.pogibshie_input').change(TableFilter.pogibshie);
    $('.postradalo_input').change(TableFilter.postradalo);
    $('.karaul_input').change(TableFilter.karaul);
    $('.type_viezs_input').change(TableFilter.type_viezs);
    $('.sluzhby_input').change(TableFilter.sluzhby);
    $('.zanyatia_input').change(TableFilter.zanyatiya);
    $('.type_signal_input').change(TableFilter.type_signal);
    $('.object_input').change(TableFilter.object);
    $('input.datepicker').change(TableFilter.date);
    $('input.datepickerker_to').change(TableFilter.date_to);
    $('.description_input').change(TableFilter.description);
    $('.rtp_input').on('change', TableFilter.rtp)
    $('input.num').on('change', jVal.numbers);
});
$('.full_stat > thead').ready(function() {
    $('table.fs_2 thead th:nth-child(1)').width($('table.full_stat thead th:nth-child(1)').width()+'px');
    $('table.fs_2 thead th:nth-child(2)').width($('table.full_stat thead th:nth-child(2)').width()+'px');
    $('table.fs_2 thead th:nth-child(3)').width($('table.full_stat thead th:nth-child(3)').width()+'px');
    $('table.fs_2 thead th:nth-child(4)').width($('table.full_stat thead th:nth-child(4)').width()+'px');
    $('table.fs_2 thead th:nth-child(5)').width($('table.full_stat thead th:nth-child(5)').width()+'px');
    $('table.fs_2 thead th:nth-child(6)').width($('table.full_stat thead th:nth-child(6)').width()+'px');
    $('table.fs_2 thead th:nth-child(7)').width($('table.full_stat thead th:nth-child(7)').width()+'px');
    $('table.fs_2 thead th:nth-child(8)').width($('table.full_stat thead th:nth-child(8)').width()+'px');
    $('table.fs_2 thead th:nth-child(9)').width($('table.full_stat thead th:nth-child(9)').width()+'px');
    $('table.fs_2 thead th:nth-child(10)').width($('table.full_stat thead th:nth-child(10)').width()+'px');
    $('table.fs_2 thead th:nth-child(11)').width($('table.full_stat thead th:nth-child(11)').width()+'px');
    $('table.fs_2 thead th:nth-child(12)').width($('table.full_stat thead th:nth-child(12)').width()+'px');
    $('table.fs_2 thead th:nth-child(13)').width($('table.full_stat thead th:nth-child(13)').width()+'px');
    $('table.fs_2 thead th:nth-child(14)').width($('table.full_stat thead th:nth-child(14)').width()+'px');
    $('table.fs_2 thead th:nth-child(15)').width($('table.full_stat thead th:nth-child(15)').width()+'px');
    $('table.fs_2 thead th:nth-child(16)').width($('table.full_stat thead th:nth-child(16)').width()+'px');
    $('table.fs_2 thead th:nth-child(17)').width($('table.full_stat thead th:nth-child(17)').width()+'px');
    $('table.fs_2 thead th:nth-child(18)').width($('table.full_stat thead th:nth-child(18)').width()+'px');
    $('table.fs_2 thead th:nth-child(19)').width($('table.full_stat thead th:nth-child(19)').width()+'px');
    $('table.fs_2 thead th:nth-child(20)').width($('table.full_stat thead th:nth-child(20)').width()+'px');
    $('table.fs_2 thead th:first-child').width($('table.full_stat thead th:nth-child(0)').width()+'px');

    $(window).scroll(function(){
        if ($(window).scrollTop() > $('table.full_stat').position().top) {
            $('table.fs_2').show();
        }
        else {
            $('table.fs_2').hide();
        }
    });

    $('.fs td').mouseenter( function() {
        $element = $(this).index();
        $('tr td:nth-child('+($element+1)+'),th:nth-child('+($element+1)+')').css({'background':'rgb(45, 114, 217)','color':'#ffffff'});
        $(this).css('font-weight','600');
    });
    $('.fs td').mouseleave( function() {
        $element = $(this).index();
        $('tr td:nth-child('+($element+1)+'),th:nth-child('+($element+1)+')').css({'background':'','color':''});
        $(this).css('font-weight','');
    });


});
