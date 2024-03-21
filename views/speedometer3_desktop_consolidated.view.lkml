
view: speedometer3_desktop_consolidated {
  derived_table: {
    sql: select 
      push_date
      -- ,case when platform = 'Android' then 'Android' else 'Desktop' end as platform__filter
      /*,sum(case when platform = 'Android' then relative_weighting*chrome_value end) as chrome_value_android
      ,sum(case when platform = 'Android' then relative_weighting*firefox_value end) as firefox_value_android
      ,-100*(
          sum(case when platform = 'Android' then relative_weighting*firefox_value end)/
          sum(case when platform = 'Android' then relative_weighting*chrome_value end)-1) as pct_delta_android*/
      ,sum(case when platform <> 'Android' then relative_weighting*chrome_value end) as chrome_value_desktop
      ,sum(case when platform <> 'Android' then relative_weighting*firefox_value end) as firefox_value_desktop
      ,-100*(
          sum(case when platform <> 'Android' then relative_weighting*firefox_value end)/
          sum(case when platform <> 'Android' then relative_weighting*chrome_value end)-1.00) as pct_delta_desktop
      from (
          select 
          date(push_timestamp) as push_date
          ,platform
          ,max(case when platform = 'Windows' then 0.8 
              when platform = 'MacOSX' then 0.2
              when platform = 'Android' then 1.0 end) as relative_weighting
          ,avg(case when application = 'chrome' then avg_value else null end) as chrome_value
          ,avg(case when application = 'firefox' then avg_value else null end) as firefox_value
          from (
              SELECT 
              pd.push_timestamp
              , case when ps.application like '%chrome%' then 'chrome' else 'firefox' end as application
              , case when lower(mp.platform) like '%windows%' then 'Windows'
                  when lower(mp.platform) like '%macos%' then 'MacOSX'
                  else 'Android' end as platform
              ,max(lower_is_better) as lower_is_better
              ,EXP( SUM( LOG( pd.value ) ) / COUNT( pd.value ) ) AS avg_value
              FROM performance_datum pd 
              JOIN performance_signature ps ON pd.signature_id = ps.id
              JOIN machine_platform mp ON ps.platform_id = mp.id
              JOIN repository r ON pd.repository_id = r.id
              WHERE push_timestamp >= date_Add(current_date(), interval -90 day)
              AND r.name = 'mozilla-central'
              and mp.platform in ('macosx1015-64-shippable-qr','windows10-64-shippable-qr'
                  ,'android-hw-a51-11-0-aarch64-shippable-qr'
                  /*,'android-hw-p6-13-0-android-aarch64-shippable-qr','android-hw-s21-13-0-android-aarch64-shippable-qr'*/
                  )
              AND ps.application in ('firefox','chrome','fenix','geckoview','chrome-m')
              and ps.suite = 'speedometer3' 
              and ps.measurement_unit = 'ms' and char_length(ps.test)-char_length(replace(ps.test,'/','')) = 1
              group by 1, 2, 3) p
          group by 1,2
          ) p
      group by 1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: push_date {
    type: date
    sql: ${TABLE}.push_date ;;
  }

  dimension: chrome_value_desktop {
    type: number
    sql: ${TABLE}.chrome_value_desktop ;;
  }

  dimension: firefox_value_desktop {
    type: number
    sql: ${TABLE}.firefox_value_desktop ;;
  }

  dimension: pct_delta_desktop {
    type: number
    sql: ${TABLE}.pct_delta_desktop ;;
  }

  set: detail {
    fields: [
        push_date,
	chrome_value_desktop,
	firefox_value_desktop,
	pct_delta_desktop
    ]
  }
}
