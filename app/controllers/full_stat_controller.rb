class FullStatController < ApplicationController
  def index
    last_day_mon = 28
    #mon = Time.now.month
    #mon1 = Time.now.month-1
    #mon3 = mon-3
    #mon6 = mon-6
    #mon9 = mon-9
    #mon_31 = [ 1, 3, 5 , 7, 8, 10, 12]
    #mon_30 = [ 4, 6, 9, 11]
    #mon_30.each { |i| last_day_mon=30 if mon1==i}
    #mon_31.each { |i| last_day_mon=31 if mon1==i}
    2==2 ? Date.new(Time.now.year).leap? ? last_day_mon = 29 : last_day_mon = 28 : false
    #mon3<1  ? mon3=1 : false
    #mon6<1  ? mon6=1 : false
    #mon9<1  ? mon9=1 : false
    @time             = Time.now
    @today            = Date.today
    @tomorrow         = Date.tomorrow
    @year             = Date.today.to_date.strftime("%Y-01-01")
    @gdzs_time        = Date.today.to_date.strftime("00:00:00")
    @needed           = '08:30'.to_time
    @yesterday        = " date = ? AND msg_time > ? " , @today-1,@needed
    @tdy              = " date = ? AND msg_time < ? " , @today,  @needed
    @else_daily       = " date = ? and msg_time > ? " , @today,  @needed
    #== Переменные для расчета ущерба от пожаров
    @fire_m_usherb =@fire_3m_usherb = @fire_6m_usherb = @fire_9m_usherb = @fire_y_usherb = @fire_ush_jan = @fire_ush_feb = @fire_ush_mar = @fire_ush_apr = @fire_ush_may =
    @fire_ush_jun = @fire_ush_jul = @fire_ush_aug = @fire_ush_sep = @fire_ush_okt = @fire_ush_nov = @fire_ush_dec = @fire_weekly_ush = @fire_daily_ush = 0
    #== Переменные для расчета спасенного при пожаре
    @fr_spas_day = @fr_spas_wek = @fr_spas_mon = @fr_spas_3mon = @fr_spas_6mon =
      @fr_spas_9mon = @fr_spas_year = @fr_spas_jan = @fr_spas_feb = @fr_spas_mar =
        @fr_spas_apr = @fr_spas_may = @fr_spas_jun = @fr_spas_jul = @fr_spas_aug =
            @fr_spas_sep = @fr_spas_okt = @fr_spas_nov = @fr_spas_dec = 0
    #== Переменные для расчета погибших при пожаре
    @fr_pog_day = @fr_pog_wek = @fr_pog_mon = @fr_pog_3mon = @fr_pog_6mon =
      @fr_pog_9mon = @fr_pog_year = @fr_pog_jan = @fr_pog_feb = @fr_pog_mar =
        @fr_pog_apr = @fr_pog_may = @fr_pog_jun = @fr_pog_jul = @fr_pog_aug =
            @fr_pog_sep = @fr_pog_okt = @fr_pog_nov = @fr_pog_dec = 0
    #== Переменные для расчета погибших при пожаре
    @fr_pos_day = @fr_pos_wek = @fr_pos_mon = @fr_pos_3mon = @fr_pos_6mon =
      @fr_pos_9mon = @fr_pos_year = @fr_pos_jan = @fr_pos_feb = @fr_pos_mar =
        @fr_pos_apr = @fr_pos_may = @fr_pos_jun = @fr_pos_jul = @fr_pos_aug =
            @fr_pos_sep = @fr_pos_okt = @fr_pos_nov = @fr_pos_dec = 0
    #== Спасено людей при пожаре
    @fr_saveppl_day = @fr_saveppl_wek = @fr_saveppl_mon = @fr_saveppl_3mon=
        @fr_saveppl_6mon = @fr_saveppl_9mon = @fr_saveppl_year = @fr_saveppl_jan =
            @fr_saveppl_feb = @fr_saveppl_mar = @fr_saveppl_apr = @fr_saveppl_may =
                @fr_saveppl_jun = @fr_saveppl_jul = @fr_saveppl_aug = @fr_saveppl_sep =
                    @fr_saveppl_okt = @fr_saveppl_nov = @fr_saveppl_dec = 0
    #= Количество потушенных пожаров с приминением звеньев ГДЗС gdzs
    @fr_gdzs_day = @fr_gdzs_wek = @fr_gdzs_mon = @fr_gdzs_3mon = @fr_gdzs_6mon =
        @fr_gdzs_9mon = @fr_gdzs_year = @fr_gdzs_jan = @fr_gdzs_feb = @fr_gdzs_mar =
            @fr_gdzs_apr = @fr_gdzs_may = @fr_gdzs_jun = @fr_gdzs_jul = @fr_gdzs_aug =
                @fr_gdzs_sep = @fr_gdzs_okt = @fr_gdzs_nov = @fr_gdzs_dec = 0
    #= Общее время работы звеньев ГДЗС gdzs_time
    @fr_ggdzs_time_day = @fr_gdzs_time_wek = @fr_gdzs_time_mon = @fr_gdzs_time_3mon = @fr_gdzs_time_6mon =
        @fr_gdzs_time_9mon = @fr_gdzs_time_year = @fr_gdzs_time_jan = @fr_gdzs_time_feb = @fr_gdzs_time_mar =
            @fr_gdzs_time_apr = @fr_gdzs_time_may = @fr_gdzs_time_jun = @fr_gdzs_time_jul = @fr_gdzs_time_aug =
                @fr_gdzs_time_sep = @fr_gdzs_time_okt = @fr_gdzs_time_nov = @fr_gdzs_time_dec = 0

    if @time < @needed #= Если текущее время меньше расчетного
      @fire_daily_usharr    = Fire.where("date = ? AND msg_time > ? and usherb > 0", @today-1,@needed) + Fire.where("date = ? AND msg_time < ? and usherb > 0", @today,  @needed)
      @fr_spas_day_arr      = Fire.where("date = ? AND msg_time > ? and spasenorub > 0", @today-1,@needed) + Fire.where("date = ? AND msg_time < ? and spasenorub > 0", @today,  @needed)
      @fr_pog_day_arr       = Fire.where("date = ? AND msg_time > ? and pogibshie > 0", @today-1,@needed) + Fire.where("date = ? AND msg_time < ? and pogibshie > 0", @today,  @needed)
      @fr_pos_day_arr       = Fire.where("date = ? AND msg_time > ? and postradavshie > 0", @today-1,@needed) + Fire.where("date = ? AND msg_time < ? and postradavshie > 0", @today,  @needed)
      @fr_saveppl_day_arr   = Fire.where("date = ? AND msg_time > ? and spasenolud > 0", @today-1,@needed) + Fire.where("date = ? AND msg_time < ? and spasenolud > 0", @today,  @needed)
      @fr_gdzs_day_arr      = Fire.where("date = ? AND msg_time > ? and gdzs > 0", @today-1,@needed) + Fire.where("date = ? AND msg_time < ? and gdzs > 0", @today,  @needed)
      @fr_gdzs_time_day_arr = Fire.where("date = ? AND msg_time > ? and gdzs_time > ?", @today-1,@needed,@gdzs_time) + Fire.where("date = ? AND msg_time < ? and gdzs_time > ?", @today,  @needed, @gdzs_time)
    else #= Если текущее время больше расчетного
      @fire_daily_usharr    = Fire.where("date = ? and msg_time > ? and usherb > 0" , @today,  @needed)
      @fr_spas_day_arr      = Fire.where("date = ? and msg_time > ? and spasenorub > 0" , @today,  @needed)
      @fr_pog_day_arr       = Fire.where("date = ? and msg_time > ? and pogibshie > 0" , @today,  @needed)
      @fr_pos_day_arr       = Fire.where("date = ? and msg_time > ? and postradavshie > 0" , @today,  @needed)
      @fr_saveppl_day_arr   = Fire.where("date = ? and msg_time > ? and spasenolud > 0" , @today,  @needed)
      @fr_gdzs_day_arr      = Fire.where("date = ? and msg_time > ? and gdzs > 0" , @today,  @needed)
      @fr_gdzs_time_day_arr = Fire.where("date = ? and msg_time > ? and gdzs_time > ?" , @today,  @needed, @gdzs_time)
    end
#######################################################################= Расширенная статистика ПОЖАРОВ =###############
    @fire_daily       = params[:fire_daily]
    @fire_wekly       = params[:fire_wekly]
    @fire_year        = params[:fire_count]
    @fire_raion_year  = params[:fires_raion_count]
    @fire_raion_daily = params[:fire_raion_daily]
    @fire_raion_wekly = params[:fire_raion_wekly]
    @fire_city_year   = params[:fires_city_count]
    @fire_city_daily  = params[:fire_city_daily]
    @fire_city_wekly  = params[:fire_city_wekly]
    @to_week_day      = params[:to_week_day]
    #= Пожаров =#
    @fire_month   = Fire.where("date >= ?", Date.today.to_date.strftime("%Y-%m-01")).count
    @fire_3month  = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-01-01"), Date.today.to_date.strftime("%Y-03-31")).count
    @fire_6month  = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-01-01"), Date.today.to_date.strftime("%Y-06-30")).count
    @fire_9month  = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-01-01"), Date.today.to_date.strftime("%Y-09-30")).count
    @fire_jan     = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-01-01"), Date.today.to_date.strftime("%Y-01-31")).count
    @fire_feb     = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-02-01"), Date.today.to_date.strftime("%Y-02-28")).count
    @fire_mar     = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-03-01"), Date.today.to_date.strftime("%Y-03-31")).count
    @fire_apr     = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-04-01"), Date.today.to_date.strftime("%Y-04-30")).count
    @fire_may     = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-05-01"), Date.today.to_date.strftime("%Y-05-31")).count
    @fire_jun     = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-06-01"), Date.today.to_date.strftime("%Y-06-30")).count
    @fire_jul     = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-07-01"), Date.today.to_date.strftime("%Y-07-31")).count
    @fire_aug     = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-08-01"), Date.today.to_date.strftime("%Y-08-31")).count
    @fire_sep     = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-09-01"), Date.today.to_date.strftime("%Y-09-30")).count
    @fire_okt     = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-10-01"), Date.today.to_date.strftime("%Y-10-31")).count
    @fire_nov     = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-11-01"), Date.today.to_date.strftime("%Y-11-30")).count
    @fire_dec     = Fire.where("date >= ? AND date <= ?", Date.today.to_date.strftime("%Y-12-01"), Date.today.to_date.strftime("%Y-12-31")).count
    #= Пожаров в городе =#
    @fire_city_month   = Fire.where("date >= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-%m-01")).count
    @fire_city_3month  = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-01-01"), Date.today.to_date.strftime("%Y-03-31")).count
    @fire_city_6month  = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-01-01"), Date.today.to_date.strftime("%Y-06-30")).count
    @fire_city_9month  = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-01-01"), Date.today.to_date.strftime("%Y-09-30")).count
    @fire_city_jan     = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-01-01"), Date.today.to_date.strftime("%Y-01-31")).count
    @fire_city_feb     = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-02-01"), Date.today.to_date.strftime("%Y-02-#{last_day_mon}")).count
    @fire_city_mar     = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-03-01"), Date.today.to_date.strftime("%Y-03-31")).count
    @fire_city_apr     = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-04-01"), Date.today.to_date.strftime("%Y-04-30")).count
    @fire_city_may     = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-05-01"), Date.today.to_date.strftime("%Y-05-31")).count
    @fire_city_jun     = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-06-01"), Date.today.to_date.strftime("%Y-06-30")).count
    @fire_city_jul     = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-07-01"), Date.today.to_date.strftime("%Y-07-31")).count
    @fire_city_aug     = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-08-01"), Date.today.to_date.strftime("%Y-08-31")).count
    @fire_city_sep     = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-09-01"), Date.today.to_date.strftime("%Y-09-30")).count
    @fire_city_okt     = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-10-01"), Date.today.to_date.strftime("%Y-10-31")).count
    @fire_city_nov     = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-11-01"), Date.today.to_date.strftime("%Y-11-30")).count
    @fire_city_dec     = Fire.where("date >= ? AND date <= ? AND address LIKE '%город%'", Date.today.to_date.strftime("%Y-12-01"), Date.today.to_date.strftime("%Y-12-31")).count
    #= Пожаров в районе =#
    @fire_raion_month   = Fire.where("date >= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-%m-01")).count
    @fire_raion_3month  = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-01-01"), Date.today.to_date.strftime("%Y-03-31")).count
    @fire_raion_6month  = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-01-01"), Date.today.to_date.strftime("%Y-06-30")).count
    @fire_raion_9month  = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-01-01"), Date.today.to_date.strftime("%Y-09-30")).count
    @fire_raion_jan     = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-01-01"), Date.today.to_date.strftime("%Y-01-31")).count
    @fire_raion_feb     = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-02-01"), Date.today.to_date.strftime("%Y-02-#{last_day_mon}")).count
    @fire_raion_mar     = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-03-01"), Date.today.to_date.strftime("%Y-03-31")).count
    @fire_raion_apr     = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-04-01"), Date.today.to_date.strftime("%Y-04-30")).count
    @fire_raion_may     = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-05-01"), Date.today.to_date.strftime("%Y-05-31")).count
    @fire_raion_jun     = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-06-01"), Date.today.to_date.strftime("%Y-06-30")).count
    @fire_raion_jul     = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-07-01"), Date.today.to_date.strftime("%Y-07-31")).count
    @fire_raion_aug     = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-08-01"), Date.today.to_date.strftime("%Y-08-31")).count
    @fire_raion_sep     = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-09-01"), Date.today.to_date.strftime("%Y-09-30")).count
    @fire_raion_okt     = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-10-01"), Date.today.to_date.strftime("%Y-10-31")).count
    @fire_raion_nov     = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-11-01"), Date.today.to_date.strftime("%Y-11-30")).count
    @fire_raion_dec     = Fire.where("date >= ? AND date <= ? AND address LIKE '%район%'", Date.today.to_date.strftime("%Y-12-01"), Date.today.to_date.strftime("%Y-12-31")).count
    #= Ущерб от пожаров руб. =# usherb
    @fire_daily_usharr.each { |i| @fire_daily_ush += i.usherb/1000 }
    Fire.where("date > ? and usherb > 0", @to_week_day ).each { |i| @fire_weekly_ush += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-%m-01"),Date.today.to_date.strftime("%Y-%m-%d")).each { |i| @fire_m_usherb  += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-03-31")).each { |i| @fire_3m_usherb  += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-06-30")).each { |i| @fire_6m_usherb  += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-09-30")).each { |i| @fire_9m_usherb  += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-%m-%d")).each { |i| @fire_y_usherb   += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-01-31")).each { |i| @fire_ush_jan    += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-02-01"),Date.today.to_date.strftime("%Y-02-#{last_day_mon}")).each { |i| @fire_ush_feb    += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-03-01"),Date.today.to_date.strftime("%Y-03-31")).each { |i| @fire_ush_mar    += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-04-01"),Date.today.to_date.strftime("%Y-04-30")).each { |i| @fire_ush_apr    += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-05-01"),Date.today.to_date.strftime("%Y-05-31")).each { |i| @fire_ush_may    += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-06-01"),Date.today.to_date.strftime("%Y-06-30")).each { |i| @fire_ush_jun    += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-07-01"),Date.today.to_date.strftime("%Y-07-31")).each { |i| @fire_ush_jul    += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-08-01"),Date.today.to_date.strftime("%Y-08-31")).each { |i| @fire_ush_aug    += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-09-01"),Date.today.to_date.strftime("%Y-09-30")).each { |i| @fire_ush_sep    += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-10-01"),Date.today.to_date.strftime("%Y-10-31")).each { |i| @fire_ush_okt    += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-11-01"),Date.today.to_date.strftime("%Y-11-30")).each { |i| @fire_ush_nov    += i.usherb/1000 }
    Fire.where("date >= ? and date <= ? and usherb > 0", Date.today.to_date.strftime("%Y-12-01"),Date.today.to_date.strftime("%Y-12-31")).each { |i| @fire_ush_dec    += i.usherb/1000 }
    #= Спасено рублей =# spasenorub
    @fr_spas_day_arr.each { |i| @fr_spas_day += i.spasenorub/1000 }
    Fire.where("date > ? and spasenorub > 0", @to_week_day ).each { |i| @fr_spas_wek += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-%m-01"),Date.today.to_date.strftime("%Y-%m-%d")).each { |i| @fr_spas_mon  += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-03-31")).each { |i| @fr_spas_3mon  += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-06-30")).each { |i| @fr_spas_6mon  += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-09-30")).each { |i| @fr_spas_9mon  += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-%m-%d")).each { |i| @fr_spas_year   += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-01-31")).each { |i| @fr_spas_jan    += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-02-01"),Date.today.to_date.strftime("%Y-02-#{last_day_mon}")).each { |i| @fr_spas_feb    += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-03-01"),Date.today.to_date.strftime("%Y-03-31")).each { |i| @fr_spas_mar    += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-04-01"),Date.today.to_date.strftime("%Y-04-30")).each { |i| @fr_spas_apr    += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-05-01"),Date.today.to_date.strftime("%Y-05-31")).each { |i| @fr_spas_may    += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-06-01"),Date.today.to_date.strftime("%Y-06-30")).each { |i| @fr_spas_jun    += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-07-01"),Date.today.to_date.strftime("%Y-07-31")).each { |i| @fr_spas_jul    += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-08-01"),Date.today.to_date.strftime("%Y-08-31")).each { |i| @fr_spas_aug    += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-09-01"),Date.today.to_date.strftime("%Y-09-30")).each { |i| @fr_spas_sep    += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-10-01"),Date.today.to_date.strftime("%Y-10-31")).each { |i| @fr_spas_okt    += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-11-01"),Date.today.to_date.strftime("%Y-11-30")).each { |i| @fr_spas_nov    += i.spasenorub/1000 }
    Fire.where("date >= ? and date <= ? and spasenorub > 0", Date.today.to_date.strftime("%Y-12-01"),Date.today.to_date.strftime("%Y-12-31")).each { |i| @fr_spas_dec    += i.spasenorub/1000 }
    #= Погибших =# pogibshie
    @fr_pog_day_arr.each { |i| @fr_pog_day += i.pogibshie }
    Fire.where("date > ? and pogibshie > 0", @to_week_day ).each { |i| @fr_pog_wek += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-%m-01"),Date.today.to_date.strftime("%Y-%m-%d")).each { |i| @fr_pog_mon  += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-03-31")).each { |i| @fr_pog_3mon  += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-06-30")).each { |i| @fr_pog_6mon  += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-09-30")).each { |i| @fr_pog_9mon  += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-%m-%d")).each { |i| @fr_pog_year   += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-01-31")).each { |i| @fr_pog_jan    += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-02-01"),Date.today.to_date.strftime("%Y-02-#{last_day_mon}")).each { |i| @fr_pog_feb    += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-03-01"),Date.today.to_date.strftime("%Y-03-31")).each { |i| @fr_pog_mar    += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-04-01"),Date.today.to_date.strftime("%Y-04-30")).each { |i| @fr_pog_apr    += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-05-01"),Date.today.to_date.strftime("%Y-05-31")).each { |i| @fr_pog_may    += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-06-01"),Date.today.to_date.strftime("%Y-06-30")).each { |i| @fr_pog_jun    += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-07-01"),Date.today.to_date.strftime("%Y-07-31")).each { |i| @fr_pog_jul    += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-08-01"),Date.today.to_date.strftime("%Y-08-31")).each { |i| @fr_pog_aug    += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-09-01"),Date.today.to_date.strftime("%Y-09-30")).each { |i| @fr_pog_sep    += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-10-01"),Date.today.to_date.strftime("%Y-10-31")).each { |i| @fr_pog_okt    += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-11-01"),Date.today.to_date.strftime("%Y-11-30")).each { |i| @fr_pog_nov    += i.pogibshie }
    Fire.where("date >= ? and date <= ? and pogibshie > 0", Date.today.to_date.strftime("%Y-12-01"),Date.today.to_date.strftime("%Y-12-31")).each { |i| @fr_pog_dec    += i.pogibshie }
    #= Пострадавших =# postradavshie
    @fr_pos_day_arr.each { |i| @fr_pos_day += i.postradavshie }
    Fire.where("date > ? and postradavshie > 0", @to_week_day ).each { |i| @fr_pos_wek += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-%m-01"),Date.today.to_date.strftime("%Y-%m-%d")).each { |i| @fr_pos_mon  += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-03-31")).each { |i| @fr_pos_3mon  += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-06-30")).each { |i| @fr_pos_6mon  += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-09-30")).each { |i| @fr_pos_9mon  += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-%m-%d")).each { |i| @fr_pos_year   += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-01-31")).each { |i| @fr_pos_jan    += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-02-01"),Date.today.to_date.strftime("%Y-02-#{last_day_mon}")).each { |i| @fr_pos_feb    += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-03-01"),Date.today.to_date.strftime("%Y-03-31")).each { |i| @fr_pos_mar    += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-04-01"),Date.today.to_date.strftime("%Y-04-30")).each { |i| @fr_pos_apr    += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-05-01"),Date.today.to_date.strftime("%Y-05-31")).each { |i| @fr_pos_may    += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-06-01"),Date.today.to_date.strftime("%Y-06-30")).each { |i| @fr_pos_jun    += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-07-01"),Date.today.to_date.strftime("%Y-07-31")).each { |i| @fr_pos_jul    += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-08-01"),Date.today.to_date.strftime("%Y-08-31")).each { |i| @fr_pos_aug    += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-09-01"),Date.today.to_date.strftime("%Y-09-30")).each { |i| @fr_pos_sep    += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-10-01"),Date.today.to_date.strftime("%Y-10-31")).each { |i| @fr_pos_okt    += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-11-01"),Date.today.to_date.strftime("%Y-11-30")).each { |i| @fr_pos_nov    += i.postradavshie }
    Fire.where("date >= ? and date <= ? and postradavshie > 0", Date.today.to_date.strftime("%Y-12-01"),Date.today.to_date.strftime("%Y-12-31")).each { |i| @fr_pos_dec    += i.postradavshie }
    #= Спасено людей =# spasenolud
    @fr_saveppl_day_arr.each { |i| @fr_saveppl_day += i.spasenolud }
    Fire.where("date > ? and spasenolud > 0", @to_week_day ).each { |i| @fr_saveppl_wek += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-%m-01"),Date.today.to_date.strftime("%Y-%m-%d")).each { |i| @fr_saveppl_mon  += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-03-31")).each { |i| @fr_saveppl_3mon  += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-06-30")).each { |i| @fr_saveppl_6mon  += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-09-30")).each { |i| @fr_saveppl_9mon  += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-%m-%d")).each { |i| @fr_saveppl_year   += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-01-31")).each { |i| @fr_saveppl_jan    += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-02-01"),Date.today.to_date.strftime("%Y-02-#{last_day_mon}")).each { |i| @fr_saveppl_feb    += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-03-01"),Date.today.to_date.strftime("%Y-03-31")).each { |i| @fr_saveppl_mar    += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-04-01"),Date.today.to_date.strftime("%Y-04-30")).each { |i| @fr_saveppl_apr    += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-05-01"),Date.today.to_date.strftime("%Y-05-31")).each { |i| @fr_saveppl_may    += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-06-01"),Date.today.to_date.strftime("%Y-06-30")).each { |i| @fr_saveppl_jun    += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-07-01"),Date.today.to_date.strftime("%Y-07-31")).each { |i| @fr_saveppl_jul    += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-08-01"),Date.today.to_date.strftime("%Y-08-31")).each { |i| @fr_saveppl_aug    += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-09-01"),Date.today.to_date.strftime("%Y-09-30")).each { |i| @fr_saveppl_sep    += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-10-01"),Date.today.to_date.strftime("%Y-10-31")).each { |i| @fr_saveppl_okt    += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-11-01"),Date.today.to_date.strftime("%Y-11-30")).each { |i| @fr_saveppl_nov    += i.spasenolud }
    Fire.where("date >= ? and date <= ? and spasenolud > 0", Date.today.to_date.strftime("%Y-12-01"),Date.today.to_date.strftime("%Y-12-31")).each { |i| @fr_saveppl_dec    += i.spasenolud }
    #= Спасено людей =# gdzs
    @fr_gdzs_day_arr.each { |i| @fr_gdzs_day += i.gdzs }
    Fire.where("date > ? and gdzs > 0", @to_week_day ).each { |i| @fr_gdzs_wek += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-%m-01"),Date.today.to_date.strftime("%Y-%m-%d")).each { |i| @fr_gdzs_mon  += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-03-31")).each { |i| @fr_gdzs_3mon  += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-06-30")).each { |i| @fr_gdzs_6mon  += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-09-30")).each { |i| @fr_gdzs_9mon  += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-%m-%d")).each { |i| @fr_gdzs_year   += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-01-31")).each { |i| @fr_gdzs_jan    += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-02-01"),Date.today.to_date.strftime("%Y-02-#{last_day_mon}")).each { |i| @fr_gdzs_feb    += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-03-01"),Date.today.to_date.strftime("%Y-03-31")).each { |i| @fr_gdzs_mar    += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-04-01"),Date.today.to_date.strftime("%Y-04-30")).each { |i| @fr_gdzs_apr    += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-05-01"),Date.today.to_date.strftime("%Y-05-31")).each { |i| @fr_gdzs_may    += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-06-01"),Date.today.to_date.strftime("%Y-06-30")).each { |i| @fr_gdzs_jun    += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-07-01"),Date.today.to_date.strftime("%Y-07-31")).each { |i| @fr_gdzs_jul    += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-08-01"),Date.today.to_date.strftime("%Y-08-31")).each { |i| @fr_gdzs_aug    += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-09-01"),Date.today.to_date.strftime("%Y-09-30")).each { |i| @fr_gdzs_sep    += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-10-01"),Date.today.to_date.strftime("%Y-10-31")).each { |i| @fr_gdzs_okt    += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-11-01"),Date.today.to_date.strftime("%Y-11-30")).each { |i| @fr_gdzs_nov    += 1 }
    Fire.where("date >= ? and date <= ? and gdzs > 0", Date.today.to_date.strftime("%Y-12-01"),Date.today.to_date.strftime("%Y-12-31")).each { |i| @fr_gdzs_dec    += 1 }
    #= Время работы ГДЗС =# gdzs_time
    @fr_gdzs_time_day_arr.each { |i| @fr_ggdzs_time_day += i.gdzs_time }
    Fire.where("date > ? and gdzs_time > ?", @to_week_day, @gdzs_time ).each { |i| @fr_gdzs_time_wek += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-%m-01"),Date.today.to_date.strftime("%Y-%m-%d"),@gdzs_time).each { |i| @fr_gdzs_time_mon  += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-03-31"),@gdzs_time).each { |i| @fr_gdzs_time_3mon  += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-06-30"),@gdzs_time).each { |i| @fr_gdzs_time_6mon  += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-09-30"),@gdzs_time).each { |i| @fr_gdzs_time_9mon  += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-%m-%d"),@gdzs_time).each { |i| @fr_gdzs_time_year   += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-01-01"),Date.today.to_date.strftime("%Y-01-31"),@gdzs_time).each { |i| @fr_gdzs_time_jan    += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-02-01"),Date.today.to_date.strftime("%Y-02-#{last_day_mon}"),@gdzs_time).each { |i| @fr_gdzs_time_feb    += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-03-01"),Date.today.to_date.strftime("%Y-03-31"),@gdzs_time).each { |i| @fr_gdzs_time_mar    += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-04-01"),Date.today.to_date.strftime("%Y-04-30"),@gdzs_time).each { |i| @fr_gdzs_time_apr    += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-05-01"),Date.today.to_date.strftime("%Y-05-31"),@gdzs_time).each { |i| @fr_gdzs_time_may    += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-06-01"),Date.today.to_date.strftime("%Y-06-30"),@gdzs_time).each { |i| @fr_gdzs_time_jun    += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-07-01"),Date.today.to_date.strftime("%Y-07-31"),@gdzs_time).each { |i| @fr_gdzs_time_jul    += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-08-01"),Date.today.to_date.strftime("%Y-08-31"),@gdzs_time).each { |i| @fr_gdzs_time_aug    += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-09-01"),Date.today.to_date.strftime("%Y-09-30"),@gdzs_time).each { |i| @fr_gdzs_time_sep    += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-10-01"),Date.today.to_date.strftime("%Y-10-31"),@gdzs_time).each { |i| @fr_gdzs_time_okt    += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-11-01"),Date.today.to_date.strftime("%Y-11-30"),@gdzs_time).each { |i| @fr_gdzs_time_nov    += i.gdzs_time.strftime("%M").to_i }
    Fire.where("date >= ? and date <= ? and gdzs_time > ?", Date.today.to_date.strftime("%Y-12-01"),Date.today.to_date.strftime("%Y-12-31"),@gdzs_time).each { |i| @fr_gdzs_time_dec    += i.gdzs_time.strftime("%M").to_i }
  end
end
