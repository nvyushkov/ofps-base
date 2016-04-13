$.extend($.expr[':'], {
    'containsi': function (elem, i, match, array) {
        return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || '').toLowerCase()) >= 0;
    }
});

$en_class = "enabled";
var TableFilter = {

    'address' : function() {
        $d_value = $(this).val().toLowerCase();
        ($('.tr').hasClass($en_class)) ?
            $('.enabled > .address').each(function () {
                $(this).is(':containsi(' + $d_value + ')')
                    ? true
                    : $(this).parent().hide().removeClass($en_class)
            })
            :
            $('.tr > .address').each(function () {
                $(this).text().toLowerCase();
                $(this).is(':containsi(' + $d_value + ')')
                    ? $(this).parent().addClass($en_class)
                    : $(this).parent().hide().removeClass($en_class)
            });
        $('#how_much').html("Количество элементов: " + $('.'+$en_class).length);},
    'rtp' : function() {
        $d_value = $(this).val();
        ($('.tr').hasClass($en_class)) ?
            $('.enabled > .rtp').each(function () {
                $(this).is(':containsi(' + $d_value + ')')
                    ? true
                    : $(this).parent().hide().removeClass($en_class)
            })
            :
            $('.tr > .rtp').each(function () {
                $(this).is(':containsi(' + $d_value + ')')
                    ? $(this).parent().addClass($en_class)
                    : $(this).parent().hide().removeClass($en_class)
            })
        $('#how_much').html("Количество элементов: " + $('.'+$en_class).length);},

    'technic' : function() {
        $d_value = $(this).val();
        ($('.tr').hasClass($en_class)) ?
            $('.enabled > .technic').each(function () {
                $(this).is(':containsi(' + $d_value + ')')
                    ? true
                    : $(this).parent().hide().removeClass($en_class)
            })
            :
            $('.tr > .technic').each(function () {
                $(this).is(':containsi(' + $d_value + ')')
                    ? $(this).parent().addClass($en_class)
                    : $(this).parent().hide().removeClass($en_class)
            })
        $('#how_much').html("Количество элементов: " + $('.'+$en_class).length);},

    'description' : function() {
        $d_value = $(this).val();
        ($('.tr').hasClass($en_class)) ?
            $('.enabled > .description').each(function () {
                $(this).is(':containsi(' + $d_value + ')')
                    ? true
                    : $(this).parent().hide().removeClass($en_class)
            })
            :
            $('.tr > .description').each(function () {
                $(this).is(':containsi(' + $d_value + ')')
                    ? $(this).parent().addClass($en_class)
                    : $(this).parent().hide().removeClass($en_class)
            })
        $('#how_much').html("Количество элементов: " + $('.'+$en_class).length);},

    'pch' : function() {
        $d_value = $(this).val();
        ($('.tr').hasClass($en_class)) ?
            $('.enabled > .pch').each(function () {
                $(this).is(':containsi(' + $d_value + ')')
                    ? true
                    : $(this).parent().hide().removeClass($en_class)
            })
            :
            $('.tr > .pch').each(function () {
                $(this).is(':containsi(' + $d_value + ')')
                    ? $(this).parent().addClass($en_class)
                    : $(this).parent().hide().removeClass($en_class)
            })
        $('#how_much').html("Количество элементов: " + $('.'+$en_class).length);},

    'sluzhby' : function() {
        $d_value = $(this).val();
        ($('.tr').hasClass($en_class)) ?
            $('.enabled > .sluzhby').each(function () {
                $(this).is(':containsi(' + $d_value + ')')
                    ? true
                    : $(this).parent().hide().removeClass($en_class)
            })
            :
            $('.tr > .sluzhby').each(function () {
                $(this).is(':containsi(' + $d_value + ')')
                    ? $(this).parent().addClass($en_class)
                    : $(this).parent().hide().removeClass($en_class)
            })
        $('#how_much').html("Количество элементов: " + $('.'+$en_class).length);},

    'gdzs'      : function() {
        $tries = $(".tr").length;
        $artr = [];
        $i = 0;
        if ($('.gdzs_input').prop('checked')) {
            while($i < $tries) {
                $artr.push($("td.gdzs:eq("+$i+")").parent());
                $new_str = ($("td.gdzs:eq("+$i+")").text()).replace(/\s+/g, '');
                if ( $new_str > 0 ) {$artr[$i].show().addClass($en_class)}
                else {$artr[$i].hide().removeClass($en_class)}
                $i ++;
            }
        }   else {
            while($i < $tries) {
                $artr.push($("td.gdzs:eq("+$i+")").parent());
                $new_str = ($("td.gdzs:eq("+$i+")").text()).replace(/\s+/g, '');
                $artr[$i].show().addClass($en_class)
                $i ++;
            }
        }
        $('#how_much').html("Количество элементов: " + $('.enabled').length);},

    'pogibshie'      : function() {
        $tries = $(".tr").length;
        $artr = [];
        $i = 0;
        if ($('.pogibshie_input').prop('checked')) {
            while($i < $tries) {
                $artr.push($("td.pogibshie:eq("+$i+")").parent());
                $new_str = ($("td.pogibshie:eq("+$i+")").text()).replace(/\s+/g, '');
                if ( $new_str > 0 ) {$artr[$i].show().addClass($en_class)}
                else {$artr[$i].hide().removeClass($en_class)}
                $i ++;
            }
        }   else {
            while($i < $tries) {
                $artr.push($("td.pogibshie:eq("+$i+")").parent());
                $new_str = ($("td.pogibshie:eq("+$i+")").text()).replace(/\s+/g, '');
                $artr[$i].show().addClass($en_class)
                $i ++;
            }
        }
        $('#how_much').html("Количество элементов: " + $('.enabled').length);},
    'postradalo'      : function() {
        $tries = $(".tr").length;
        $artr = [];
        $i = 0;
        if ($('.postradalo_input').prop('checked')) {
            while($i < $tries) {
                $artr.push($("td.postradalo:eq("+$i+")").parent());
                $new_str = ($("td.postradalo:eq("+$i+")").text()).replace(/\s+/g, '');
                if ( $new_str > 0 ) {$artr[$i].show().addClass($en_class)}
                else {$artr[$i].hide().removeClass($en_class)}
                $i ++;
            }
        }   else {
            while($i < $tries) {
                $artr.push($("td.postradalo:eq("+$i+")").parent());
                $new_str = ($("td.postradalo:eq("+$i+")").text()).replace(/\s+/g, '');
                $artr[$i].show().addClass($en_class)
                $i ++;
            }
        }
        $('#how_much').html("Количество элементов: " + $('.enabled').length);},

    'karaul'    : function() {
        $d_value = $(this).val().replace(/\s+/g, '');
        ($('.tr').hasClass($en_class)) ?
            $('.enabled > .karaul').each(function(){$d_value.replace(/\s+/g, '') != ($(this).text()).replace(/\s+/g, '')
                ? $(this).parent().hide().removeClass($en_class)
                : false})
            :
            $('.tr > .karaul').each(function(){$d_value != ($(this).text()).replace(/\s+/g, '')
                ? $(this).parent().hide().removeClass($en_class)
                : $(this).parent().show().addClass($en_class)})
        $('#how_much').html("Количество элементов: " + $('.enabled').length);},

    'type_viezs'    : function() {
        $d_value = $(this).val().replace(/\s+/g, '');
        ($('.tr').hasClass($en_class)) ?
            $('.enabled > .type_viezd').each(function(){$d_value.replace(/\s+/g, '') != ($(this).text()).replace(/\s+/g, '')
                ? $(this).parent().hide().removeClass($en_class)
                : false})
            :
            $('.tr > .type_viezd').each(function(){$d_value != ($(this).text()).replace(/\s+/g, '')
                ? $(this).parent().hide().removeClass($en_class)
                : $(this).parent().show().addClass($en_class)})
        $('#how_much').html("Количество элементов: " + $('.enabled').length);},

    'type_signal'    : function() {
        $d_value = $(this).val().replace(/\s+/g, '');
        ($('.tr').hasClass($en_class)) ?
            $('.enabled > .type_signal').each(function(){$d_value.replace(/\s+/g, '') != ($(this).text()).replace(/\s+/g, '')
                ? $(this).parent().hide().removeClass($en_class)
                : false})
            :
            $('.tr > .type_signal').each(function(){$d_value != ($(this).text()).replace(/\s+/g, '')
                ? $(this).parent().hide().removeClass($en_class)
                : $(this).parent().show().addClass($en_class)})
        $('#how_much').html("Количество элементов: " + $('.enabled').length);},

    'zanyatiya'    : function() {
        $d_value = $(this).val().replace(/\s+/g, '');
        ($('.tr').hasClass($en_class)) ?
            $('.enabled > .zanyatiya').each(function(){$d_value.replace(/\s+/g, '') != ($(this).text()).replace(/\s+/g, '')
                ? $(this).parent().hide().removeClass($en_class)
                : false})
            :
            $('.tr > .zanyatiya').each(function(){$d_value != ($(this).text()).replace(/\s+/g, '')
                ? $(this).parent().hide().removeClass($en_class)
                : $(this).parent().show().addClass($en_class)})
        $('#how_much').html("Количество элементов: " + $('.enabled').length);},

    'object'    : function() {
        $d_value = $(this).val().replace(/\s+/g, '');
        ($('.tr').hasClass($en_class)) ?
            $('.enabled > .object').each(function(){$d_value.replace(/\s+/g, '') != ($(this).text()).replace(/\s+/g, '')
                ? $(this).parent().hide().removeClass($en_class)
                : false})
            :
            $('.tr > .object').each(function(){$d_value != ($(this).text()).replace(/\s+/g, '')
                ? $(this).parent().hide().removeClass($en_class)
                : $(this).parent().show().addClass($en_class)})
        $('#how_much').html("Количество элементов: " + $('.enabled').length);},

    'date': function() {
            $d_value = $(this).val().replace(/\s+/g, '');
            ($('.tr').hasClass($en_class)) ?
                        $('.enabled > .date').each(function(){$d_value.replace(/\s+/g, '') != ($(this).text()).replace(/\s+/g, '')
                            ? $(this).parent().hide().removeClass($en_class)
                            : false})
                        :
                        $('.tr > .date').each(function(){$d_value != ($(this).text()).replace(/\s+/g, '')
                            ? $(this).parent().hide().removeClass($en_class)
                            : $(this).parent().show().addClass($en_class)})
            $('#how_much').html("Количество элементов: " + $('.'+$en_class).length);},

    'date_to': function() {
        $d_value1 = $('.datepicker').val().replace(/\s+/g, '');
        $d_value2 = $(this).val().replace(/\s+/g, '');
        $Date1 = new Date($d_value1.replace(/(\d+).(\d+).(\d+)/, '$2/$1/$3'));
        $Date2 = new Date($d_value2.replace(/(\d+).(\d+).(\d+)/, '$2/$1/$3'));
            $('.tr > .date').each(function(){
                $this = $(this).text();
                $this_date = new Date($this.replace(/(\d+).(\d+).(\d+)/, '$2/$1/$3'))

                $Date1 <= $this_date && $this_date<= $Date2
                ? $(this).parent().show().addClass($en_class)
                : $(this).parent().hide()
            })
        $('#how_much').html("Количество элементов: " + $('.'+$en_class).length);
    }
};


/*/////////////////// VALIDATION */

var jVal = {

    'numbers': function () {
        $('body').append('<div id="number_info" class="info"></div>');
        var self = $(this).val();
        var wrong = $('input');
        var number_info = $('#number_info');
        var patt = /^[0-9.]+$/;
        var pos = $(this).offset();
        var submit = $('input[type="submit"]');
        number_info.css({
            top: pos.top + 2,
            left: pos.left + $(this).width() + 15,
            position: 'absolute'
        });
        if (!patt.test(self)) {
            jVal.error = true;
            number_info.removeClass('correct').addClass('error').html('← В это поле только цифры').show();
            $(this).addClass('wrong');
        }
        else {
            jVal.error = false;
            number_info.removeClass('error').addClass('correct').html('√').show();
            $(this).removeClass('wrong');
        }
        (wrong.hasClass('wrong')) ? (submit.attr('disabled', true), submit.addClass('disabled')) : (submit.attr('disabled', false),submit.removeClass('disabled'));
    }
};
