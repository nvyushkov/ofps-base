class MainController < ApplicationController
  before_action :settings, only: [:index, :daily, :weekly]

#=######  MAIN PAGE #######################
  def index
    #=##### Что и как мы выводим в статистику
    if @time < @needed #= Если текущее время меньше расчетного
      @segodnya = @today
      @fire_city_daily  = Fire.where("date = ? AND msg_time > ? AND address LIKE '%город%'", @today-1,@needed).count + Fire.where("date = ? AND msg_time < ? AND address LIKE '%город%'", @today,  @needed).count
      @fire_raion_daily = Fire.where("date = ? AND msg_time > ?AND address LIKE '%район%'", @today-1,@needed).count + Fire.where("date = ? AND msg_time < ? AND address LIKE '%район%'", @today,  @needed).count
      @fire_daily       = Fire.where(@yesterday).count          + Fire.where(@tdy).count
      @dtp_daily        = Dtp.where(@yesterday).count           + Dtp.where(@tdy).count
      @edds_daily       = Eddscard.where(@yesterday).count      + Eddscard.where(@tdy).count
      @fpsignal_daily   = Fpsignal.where(@yesterday).count      + Fpsignal.where(@tdy).count
      @prochie_daily    = Prochie.where(@yesterday).count       + Prochie.where(@tdy).count
      @ptpktp_daily     = Ptpktp.where(@yesterday).count        + Ptpktp.where(@tdy).count
      @vozgor_daily     = Vozgoranie.where(@yesterday).count    + Vozgoranie.where(@tdy).count
      @zanyatia_daily   = Zanyatium.where(@yesterday).count     + Zanyatium.where(@tdy).count
      @edsproch_daily   = EddsProchie.where(@yesterday).count   + EddsProchie.where(@tdy).count
      @lozhn_daily      = Prochie.where(@else_lozh).count       + Prochie.where(@lozh_daily).count
      @electr_daily     = EddsProchie.where(@else_electr).count + EddsProchie.where(@electri_daily).count
      @water_daily      = EddsProchie.where(@else_water).count  + EddsProchie.where(@wateri_daily).count
      @vz072_daily      = Prochie.where(@else_v072).count       + Prochie.where(@v072_daily).count
      @proch_kz_daily   = Prochie.where(@else_kz).count         + Prochie.where(@kz_daily).count
      @podgor_daily     = Prochie.where(@else_podpish).count    + Prochie.where(@podpish_daily).count
      @vz02_daily       = Prochie.where(@else_v02).count        + Prochie.where(@v02_daily).count
      @vz03_daily       = Prochie.where(@else_v03).count        + Prochie.where(@v03_daily).count
      @vz04_daily       = Prochie.where(@else_v04).count        + Prochie.where(@v04_daily).count
    else #= Если текущее время больше расчетного
      @segodnya = @today +1
      @fire_city_daily  = Fire.where(" date = ? and msg_time > ? AND address LIKE '%город%'" , @today,  @needed).count
      @fire_raion_daily = Fire.where(" date = ? and msg_time > ? AND address LIKE '%район%'" , @today,  @needed).count
      @fire_daily       = Fire.where(         @else_daily     ).count
      @dtp_daily        = Dtp.where(          @else_daily     ).count
      @edds_daily       = Eddscard.where(     @else_daily     ).count
      @fpsignal_daily   = Fpsignal.where(     @else_daily     ).count
      @prochie_daily    = Prochie.where(      @else_daily     ).count
      @ptpktp_daily     = Ptpktp.where(       @else_daily     ).count
      @vozgor_daily     = Vozgoranie.where(   @else_daily     ).count
      @zanyatia_daily   = Zanyatium.where(    @else_daily     ).count
      @edsproch_daily   = EddsProchie.where(  @else_daily     ).count
      @lozhn_daily      = Prochie.where(      @lozh_today     ).count
      @electr_daily     = Prochie.where(      @electr_today   ).count
      @water_daily      = Prochie.where(      @water_today    ).count
      @proch_kz_daily   = Prochie.where(      @kz_today       ).count
      @podgor_daily     = Prochie.where(      @podpish_today  ).count
      @vz02_daily       = Prochie.where(      @v02_today      ).count
      @vz03_daily       = Prochie.where(      @v03_today      ).count
      @vz04_daily       = Prochie.where(      @v04_today      ).count
      @vz072_daily      = Prochie.where(      @v072_today     ).count
    end

    #= Расчет за неделю от пятницы до пятницы
    @fire_wekly         = Fire.where(       " date > ?", @to_week_day ).count
    @dtp_wekly          = Dtp.where(        " date > ?", @to_week_day ).count
    @edds_wekly         = Eddscard.where(   " date > ?", @to_week_day ).count
    @fpsignal_wekly     = Fpsignal.where(   " date > ?", @to_week_day ).count
    @prochie_wekly      = Prochie.where(    " date > ?", @to_week_day ).count
    @ptpktp_wekly       = Ptpktp.where(     " date > ?", @to_week_day ).count
    @vozgor_wekly       = Vozgoranie.where( " date > ?", @to_week_day ).count
    @zanyatia_wekly     = Zanyatium.where(  " date > ?", @to_week_day ).count
    @edsproch_wekly     = EddsProchie.where(" date > ?", @to_week_day ).count
    @fire_city_wekly    = Fire.where(       " date > ? AND address LIKE '%город%'", @to_week_day ).count
    @fire_raion_wekly   = Fire.where(       " date > ? AND address LIKE '%район%'", @to_week_day ).count
    @lozhn_wekly        = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Ложные').count
    @electr_wekly       = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Отключение электр.').count
    @water_wekly        = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Отключение воды').count
    @kz_wekly           = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'КЗ').count
    @podgor_wekly       = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Подгорание пищи').count
    @vz02_wekly         = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Взаимодействие 02').count
    @vz03_wekly         = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Взаимодействие 03').count
    @vz04_wekly         = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Взаимодействие 04').count
    @vz072_wekly        = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Взаимодействие 072').count

    ################= ВЫЕЗДА ПО ТРЕВОГЕ =################
    @dtp_viezd_count  = Dtp.where("date >= ? and (technic_pch LIKE '%АЦ%' or technic_pch LIKE '%АРС%') ", @year).count
    @count_kz         = Prochie.where("date >= ? and type_viezd LIKE '%КЗ%' ",          @year).count
    @count_podg_pish  = Prochie.where("date >= ? and type_viezd LIKE '%Подгорание%' ",  @year).count
    @count_vzaimod02  = Prochie.where("date >= ? and type_viezd LIKE '%02%'  and (sluzhby LIKE '%АЦ%' or sluzhby LIKE '%АЛ%' or sluzhby LIKE '%01%')", @year).count
    @count_vzaimod03  = Prochie.where("date >= ? and type_viezd LIKE '%03%'  and (sluzhby LIKE '%АЦ%' or sluzhby LIKE '%АЛ%' or sluzhby LIKE '%01%')", @year).count
    @count_vzaimod072 = Prochie.where("date >= ? and type_viezd LIKE '%072%' and (sluzhby LIKE '%АЦ%' or sluzhby LIKE '%АЛ%' or sluzhby LIKE '%01%')", @year).count
    @count_vzaimod04  = Prochie.where("date >= ? and type_viezd LIKE '%04%'  and (sluzhby LIKE '%АЦ%' or sluzhby LIKE '%АЛ%' or sluzhby LIKE '%01%')", @year).count
    @trevoga_count    = @fire_count + @vozgor_count + @lozh_count   + @dtp_viezd_count  + @count_kz       + @count_podg_pish
    @trevoga_daily    = @fire_daily + @dtp_daily    + @vozgor_daily + @lozhn_daily      + @proch_kz_daily + @podgor_daily
    @trevoga_wekly    = @fire_wekly + @dtp_wekly    + @vozgor_wekly + @lozhn_wekly      + @kz_wekly       + @podgor_wekly

    ###############= Взаимодействия =##################
    @count_vzaimod04_all  = Prochie.where("date >= ? and type_viezd LIKE '%04%'", @year).count
    @count_vzaimod02_all  = Prochie.where("date >= ? and type_viezd LIKE '%02%'", @year).count
    @count_vzaimod03_all  = Prochie.where("date >= ? and type_viezd LIKE '%03%'", @year).count
    @count_vzaimod072_all = Prochie.where("date >= ? and type_viezd LIKE '%072%'", @year).count
    @count_vzaimod_all    = @count_vzaimod04_all+@count_vzaimod02_all+@count_vzaimod03_all+@count_vzaimod072_all
    @count_vzaimod_weekly = @vz02_wekly+@vz03_wekly+@vz04_wekly+@vz072_wekly
    @count_vzaimod_daily  = @vz02_daily+@vz03_daily+@vz04_daily+@vz072_daily
    #################################################
    ###############= РАСЧЕТ ПО ИППВ =###################
    @fires_city             = Fire.where( " date >= ? and address LIKE '%город%'", @year)
    @fires_raion            = Fire.where( " date >= ? and address LIKE '%район%'", @year)
    @fires_city_count       = @fires_city.count
    @fires_raion_count      = @fires_raion.count
    @ac_not_water           = Ipv.where( " ac_not_water > 0" ).count
    @pg_magistral_line      = Ipv.where( " pg_magistral_line > 0" ).count
    @pv_magistral_line      = Ipv.where( " pv_magistral_line > 0" ).count
    @vodoem_magistral_line  = Ipv.where( " vodoem_magistral_line > 0" ).count
    @vnb_magistral_line     = Ipv.where( " vnb_magistral_line > 0" ).count
    @vnutr_vodoem           = Ipv.where( " vnutr_vodoem > 0" ).count
    @perekachka             = Ipv.where( " perekachka > 0" ).count
    @pg_podvoz              = Ipv.where( " pg_podvoz > 0" ).count
    @pv_podvoz              = Ipv.where( " pv_podvoz > 0" ).count
    @vnb_podvoz             = Ipv.where( " vnb_podvoz > 0").count
    @vodoem_podvoz          = Ipv.where( " vodoem_podvoz > 0" ).count
    @neskolko               = Ipv.where( " neskolko > 0" ).count
    @do_pribytia            = Ipv.where( " do_pribytia > 0" ).count
    @a = @b = @c = @d = @e = @f = @g  = @h = @i = @j = @k = @l = @m = 0
    #= Расчет ИППВ по городу
    @fires_city.each { |city|
      @ac_not_water_city      = @a + Ipv.where( " fire_id = ? and ac_not_water > 0 ",           city.id ).count
      @pg_magistral_city      = @b + Ipv.where( " fire_id = ? and pg_magistral_line > 0 ",      city.id ).count
      @pv_magistral_city      = @c + Ipv.where( " fire_id = ? and pv_magistral_line > 0 ",      city.id ).count
      @vodoem_magistral_city  = @d + Ipv.where( " fire_id = ? and vodoem_magistral_line > 0 ",  city.id ).count
      @vnb_magistral_city     = @e + Ipv.where( " fire_id = ? and vnb_magistral_line > 0 ",     city.id ).count
      @vnutr_vodoem_city      = @f + Ipv.where( " fire_id = ? and vnutr_vodoem > 0 ",           city.id ).count
      @perekachka_city        = @g + Ipv.where( " fire_id = ? and perekachka > 0 ",             city.id ).count
      @pg_podvoz_city         = @h + Ipv.where( " fire_id = ? and pg_podvoz > 0 ",              city.id ).count
      @pv_podvoz_city         = @i + Ipv.where( " fire_id = ? and pv_podvoz > 0 ",              city.id ).count
      @vodoem_podvoz_city     = @j + Ipv.where( " fire_id = ? and vodoem_podvoz > 0 ",          city.id ).count
      @vnb_podvoz_city        = @k + Ipv.where( " fire_id = ? and vnb_podvoz > 0 ",             city.id ).count
      @neskolko_city          = @l + Ipv.where( " fire_id = ? and neskolko > 0 ",               city.id ).count
      @do_pribytia_city       = @m + Ipv.where( " fire_id = ? and do_pribytia > 0 ",            city.id ).count
      @a = @ac_not_water_city
      @b = @pg_magistral_city
      @c = @pv_magistral_city
      @d = @vodoem_magistral_city
      @e = @vnb_magistral_city
      @f = @vnutr_vodoem_city
      @g = @perekachka_city
      @h = @pg_podvoz_city
      @i = @pv_podvoz_city
      @j = @vodoem_podvoz_city
      @k = @vnb_podvoz_city
      @l = @neskolko_city
      @m = @do_pribytia_city
    }
    @a = @b = @c = @d = @e = @f = @g  = @h = @i = @j = @k = @l = @m = 0
    #= Расчет ИППВ по району
    @fires_raion.each { |raion|
      @ac_not_water_raion      = @a + Ipv.where( " fire_id = ? and ac_not_water > 0 ",          raion.id ).count
      @pg_magistral_raion      = @b + Ipv.where( " fire_id = ? and pg_magistral_line > 0 ",     raion.id ).count
      @pv_magistral_raion      = @c + Ipv.where( " fire_id = ? and pv_magistral_line > 0 ",     raion.id ).count
      @vodoem_magistral_raion  = @d + Ipv.where( " fire_id = ? and vodoem_magistral_line > 0 ", raion.id ).count
      @vnb_magistral_raion     = @e + Ipv.where( " fire_id = ? and vnb_magistral_line > 0 ",    raion.id ).count
      @vnutr_vodoem_raion      = @f + Ipv.where( " fire_id = ? and vnutr_vodoem > 0 ",          raion.id ).count
      @perekachka_raion        = @g + Ipv.where( " fire_id = ? and perekachka > 0 ",            raion.id ).count
      @pg_podvoz_raion         = @h + Ipv.where( " fire_id = ? and pg_podvoz > 0 ",             raion.id ).count
      @pv_podvoz_raion         = @i + Ipv.where( " fire_id = ? and pv_podvoz > 0 ",             raion.id ).count
      @vodoem_podvoz_raion     = @j + Ipv.where( " fire_id = ? and vodoem_podvoz > 0 ",         raion.id ).count
      @vnb_podvoz_raion        = @k + Ipv.where( " fire_id = ? and vnb_podvoz > 0 ",            raion.id ).count
      @neskolko_raion          = @l + Ipv.where( " fire_id = ? and neskolko > 0 ",              raion.id ).count
      @do_pribytia_raion       = @m + Ipv.where( " fire_id = ? and do_pribytia > 0 ",           raion.id ).count
      @a = @ac_not_water_raion
      @b = @pg_magistral_raion
      @c = @pv_magistral_raion
      @d = @vodoem_magistral_raion
      @e = @vnb_magistral_raion
      @f = @vnutr_vodoem_raion
      @g = @perekachka_raion
      @h = @pg_podvoz_raion
      @i = @pv_podvoz_raion
      @j = @vodoem_podvoz_raion
      @k = @vnb_podvoz_raion
      @l = @neskolko_raion
      @m = @do_pribytia_raion
    }
  end
#=######  TODAY PAGE #######################
  def daily
    if Time.now < '8:30'.to_time #= Если текущее время меньше расчетного
      @fire           = Fire.where(        @yesterday       ) + Fire.where(         @tdy )
      @dtp            = Dtp.where(         @yesterday       ) + Dtp.where(          @tdy )
      @ptpktp         = Ptpktp.where(      @yesterday       ) + Ptpktp.where(       @tdy )
      @vozgor         = Vozgoranie.where(  @yesterday       ) + Vozgoranie.where(   @tdy )
      @zanyatia       = Zanyatium.where(   @yesterday       ) + Zanyatium.where(    @tdy )
      @lozhn          = Prochie.where(     @else_lozh    ) + Prochie.where(      @lozh_daily    )
      @proch_v02      = Prochie.where(     @else_v02     ) + Prochie.where(      @v02_daily     )
      @proch_v03      = Prochie.where(     @else_v03     ) + Prochie.where(      @v03_daily     )
      @proch_v04      = Prochie.where(     @else_v04     ) + Prochie.where(      @v04_daily     )
      @proch_v072     = Prochie.where(     @else_v072    ) + Prochie.where(      @v072_daily    )
      @proch_vdr      = Prochie.where(     @else_vdr     ) + Prochie.where(      @vdr_daily     )
      @proch_kz       = Prochie.where(     @else_kz      ) + Prochie.where(      @kz_daily      )
      @proch_podpish  = Prochie.where(     @else_podpish ) +  Prochie.where(     @podpish_daily )
      @proch_lsps     = Prochie.where(     @else_lsps    ) + Prochie.where(      @lsps_daily    )
      @proch_zap      = Prochie.where(     @else_zap     ) + Prochie.where(      @zap_daily     )
      @proch_zazs     = Prochie.where(     @else_zazs    ) + Prochie.where(      @zazs_daily    )
      @proch_pmd      = Prochie.where(     @else_pmd     ) + Prochie.where(      @pmd_daily     )
      @proch_terract  = Prochie.where(     @else_terract ) + Prochie.where(      @terract_daily )
      @proch_sluzheb  = Prochie.where(     @else_sluzheb ) + Prochie.where(      @sluzheb_daily )
      @proch_gszopr   = Prochie.where(     @else_gazopr  ) + Prochie.where(      @gszopr_daily  )
      @proch_poter    = Prochie.where(     @else_poter   ) + Prochie.where(      @poter_daily   )
      @proch_meteo    = Prochie.where(     @else_meteo   ) + Prochie.where(      @meteodaily    )
    else #= Если текущее время больше расчетного
      @fire           =  Fire.where(        @else_daily    )
      @dtp            =  Dtp.where(         @else_daily     )
      @prochie        =  Prochie.where(     @else_daily     )
      @ptpktp         =  Ptpktp.where(      @else_daily     )
      @vozgor         =  Vozgoranie.where(  @else_daily     )
      @zanyatia       =  Zanyatium.where(   @else_daily     )
      @lozhn          =  Prochie.where(     @lozh_today   )
      @proch_v02      =  Prochie.where(     @v02_today     )
      @proch_v03      =  Prochie.where(     @v03_today     )
      @proch_v04      =  Prochie.where(     @v04_today     )
      @proch_v072     =  Prochie.where(     @v072_today    )
      @proch_vdr      =  Prochie.where(     @vdr_today     )
      @proch_kz       =  Prochie.where(     @kz_today      )
      @proch_podpish  =  Prochie.where(     @podpish_today )
      @proch_lsps     =  Prochie.where(     @lsps_today    )
      @proch_zap      =  Prochie.where(     @zap_today     )
      @proch_zazs     =  Prochie.where(     @zazs_today    )
      @proch_pmd      =  Prochie.where(     @pmd_today     )
      @proch_terract  =  Prochie.where(     @terract_today )
      @proch_sluzheb  =  Prochie.where(     @sluzheb_today )
      @proch_gszopr   =  Prochie.where(     @gszopr_today  )
      @proch_poter    =  Prochie.where(     @poter_today   )
      @proch_meteo    =  Prochie.where(     @meteo_today   )
    end
  end
#=######  WEEKLY #######################
  def weekly

  end
    private
# Use callbacks to share common setup or constraints between actions.
    def settings
  #=##### Date and time
      @time             = Time.now
      @today            = Date.today
      @tomorrow         = Date.tomorrow
      @year             = Date.today.to_date.strftime("%Y-01-01")
      @needed           = '08:30'.to_time
      @yesterday        = " date = ? AND msg_time > ? " , @today-1,@needed
      @tdy              = " date = ? AND msg_time < ? " , @today,  @needed
      @else_daily       = " date = ? and msg_time > ? " , @today,  @needed
  #=##### On week days
      if    @time.wday  == 0 then  @wday = 2 # ВС
      elsif @time.wday  == 1 then  @wday = 3 # ПН
      elsif @time.wday  == 2 then  @wday = 4 # ВТ
      elsif @time.wday  == 3 then  @wday = 5 # СР
      elsif @time.wday  == 4 then  @wday = 6 # ЧТ
      elsif @time.wday  == 5 then  @wday = 7 # ПТ
      elsif @time.wday  == 6 then  @wday = 1 # СБ
      end
      @to_week_day = @today - @wday
  #=##### Общее количество
      @fire_count       = Fire.where("date >= ?", @year).count
      @dtp_count        = Dtp.where("date >= ?", @year).count
      @edds_count       = Eddscard.where("date >= ?", @year).count
      @fpsignal_count   = Fpsignal.where("date >= ?", @year).count
      @prochie_count    = Prochie.where("date >= ?", @year).count
      @ptpktp_count     = Ptpktp.where("date >= ?", @year).count
      @vozgor_count     = Vozgoranie.where("date >= ?", @year).count
      @zanyatia_count   = Zanyatium.where("date >= ?", @year).count
      @edds_proch       = EddsProchie.where("date >= ?", @year).count
      @lozh_count       = Prochie.where( "date >= ? and type_viezd = ?" , @year, 'Ложные').count
      @electr_count     = Prochie.where( "date >= ? and type_viezd = ?" , @year, 'Отключение электр.').count
      @water_count      = Prochie.where( "date >= ? and type_viezd = ?" , @year, 'Отключение воды').count
  #=##### Вынос выборки в переменные
  #=######  Если сегодня время больше расчетного
      @lozh_today       = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Ложные'
      @electr_today     = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Отключение электр.'
      @water_today      = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Отключение воды'
      @kz_today         = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'КЗ'
      @podpish_today    = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Подгорание пищи'
      @v02_today        = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Взаимодействие 02'
      @v03_today        = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Взаимодействие 03'
      @v04_today        = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Взаимодействие 04'
      @v072_today       = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Взаимодействие 072'
      @vdr_today        = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Взаимодействие с другими службами'
      @lsps_today       = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Ложный СПС'
      @zap_today        = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Заправка АП'
      @pmd_today        = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'ПМД'
      @zazs_today       = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Заправка АЗС'
      @terract_today    = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Терракт'
      @sluzheb_today    = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Служебный'
      @gszopr_today     = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Газопроводы'
      @poter_today      = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Потеряшки'
      @meteo_today      = " date = ? and msg_time > ? and type_viezd = ?" , @today, @needed, 'Метеоявления'
  #=######  Если сегодня время меньше расчетного
      @lozh_daily       = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Ложные'
      @electri_daily    = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Отключение электр.'
      @wateri_daily     = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Отключение воды'
      @kz_daily         = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'КЗ'
      @podpish_daily    = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Подгорание пищи'
      @v02_daily        = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Взаимодействие 02'
      @v03_daily        = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Взаимодействие 03'
      @v04_daily        = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Взаимодействие 04'
      @v072_daily       = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Взаимодействие 072'
      @vdr_daily        = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Взаимодействие с другими службами'
      @lsps_daily       = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Ложный СПС'
      @zap_daily        = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Заправка АП'
      @zazs_daily       = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Заправка АЗС'
      @pmd_daily        = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'ПМД'
      @terract_daily    = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Терракт'
      @sluzheb_daily    = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Служебный'
      @gszopr_daily     = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Газопроводы'
      @poter_daily      = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Потеряшки'
      @meteodaily       = " date = ? and msg_time < ? and type_viezd = ?" , @today, @needed, 'Метеоявления'
  #=######  Если вчера время больше расчетного
      @else_lozh        = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Ложные'
      @else_electr      = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Отключение электр.'
      @else_water       = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Отключение воды'
      @else_kz          = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'КЗ'
      @else_podpish     = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Подгорание пищи'
      @else_v02         = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Взаимодействие 02'
      @else_v03         = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Взаимодействие 03'
      @else_v04         = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Взаимодействие 04'
      @else_v072        = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Взаимодействие 072'
      @else_vdr         = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Взаимодействие с другими службами'
      @else_lsps        = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Ложный СПС'
      @else_zap         = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Заправка АП'
      @else_zazs        = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Заправка АЗС'
      @else_pmd         = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'ПМД'
      @else_terract     = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Терракт'
      @else_sluzheb     = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Служебный'
      @else_gazopr      = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Газопроводы'
      @else_poter       = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Потеряшки'
      @else_meteo       = " date = ? and msg_time > ? and type_viezd = ?" , @today-1, @needed, 'Метеоявления'
  #= Расчет за неделю от пятницы до пятницы
      @fire_wekly       = Fire.where(       " date > ?", @to_week_day ).count
      @dtp_wekly        = Dtp.where(        " date > ?", @to_week_day ).count
      @edds_wekly       = Eddscard.where(   " date > ?", @to_week_day ).count
      @fpsignal_wekly   = Fpsignal.where(   " date > ?", @to_week_day ).count
      @prochie_wekly    = Prochie.where(    " date > ?", @to_week_day ).count
      @ptpktp_wekly     = Ptpktp.where(     " date > ?", @to_week_day ).count
      @vozgor_wekly     = Vozgoranie.where( " date > ?", @to_week_day ).count
      @zanyatia_wekly   = Zanyatium.where(  " date > ?", @to_week_day ).count
      @edsproch_wekly   = EddsProchie.where(" date > ?", @to_week_day ).count
      @lozhn_wekly      = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Ложные').count
      @electr_wekly     = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Отключение электр.').count
      @water_wekly      = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Отключение воды').count
      @kz_wekly         = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'КЗ').count
      @podgor_wekly     = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Подгорание пищи').count
      @vz02_wekly       = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Взаимодействие 02').count
      @vz03_wekly       = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Взаимодействие 03').count
      @vz04_wekly       = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Взаимодействие 04').count
      @vz072_wekly      = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Взаимодействие 072').count
      @fire_wekly1      = Fire.where(       " date > ?", @to_week_day ).order(date: :desc, msg_time: :desc)
      @dtp_wekly1       = Dtp.where(        " date > ?", @to_week_day ).order(date: :desc, msg_time: :desc)
      @edds_wekly1      = Eddscard.where(   " date > ?", @to_week_day ).order(date: :desc, msg_time: :desc)
      @fpsignal_wekly1  = Fpsignal.where(   " date > ?", @to_week_day ).order(date: :desc, msg_time: :desc)
      @prochie_wekly1   = Prochie.where(    " date > ?", @to_week_day ).order(date: :desc, msg_time: :desc)
      @ptpktp_wekly1    = Ptpktp.where(     " date > ?", @to_week_day ).order(date: :desc, msg_time: :desc)
      @vozgor_wekly1    = Vozgoranie.where( " date > ?", @to_week_day ).order(date: :desc, msg_time: :desc)
      @zanyatia_wekly1  = Zanyatium.where(  " date > ?", @to_week_day ).order(date: :desc, msg_time: :desc)
      @edsproch_wekly1  = EddsProchie.where(" date > ?", @to_week_day ).order(date: :desc, msg_time: :desc)
      @lozhn_wekly1     = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Ложные')
      @electr_wekly1    = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Отключение электр.')
      @water_wekly1     = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Отключение воды')
      @kz_wekly1        = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'КЗ')
      @podgor_wekly1    = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Подгорание пищи')
      @vz02_wekly1      = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Взаимодействие 02')
      @vz03_wekly1      = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Взаимодействие 03')
      @vz04_wekly1      = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Взаимодействие 04')
      @vz072_wekly1     = Prochie.where(    " date > ? and type_viezd = ? ", @to_week_day , 'Взаимодействие 072')
    end
end