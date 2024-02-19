
view: speedometer3_timeseries {
  derived_table: {
    sql: SELECT
      pd.push_timestamp
      ,ps.application
      ,case when mp.platform = 'macosx1015-64-shippable-qr' then 'MacOS'
          when mp.platform = 'linux1804-64-shippable-qr' then 'Linux'
          when mp.platform = 'windows10-64-shippable-qr' then 'Windows'
          end as platform
      ,EXP(SUM(LOG(pd.value)) / COUNT(pd.value)) AS geomean_value
      FROM performance_datum pd
      JOIN performance_signature ps ON pd.signature_id = ps.id
      JOIN machine_platform mp ON ps.platform_id = mp.id
      JOIN repository r ON pd.repository_id = r.id
      WHERE r.name = 'mozilla-central'
      and mp.platform in ('macosx1015-64-shippable-qr','linux1804-64-shippable-qr','windows10-64-shippable-qr')
      -- and mp.platform = 'windows10-64-shippable-qr'
      AND ps.application in('firefox','chrome','custom-car')
      and ps.suite = 'speedometer3'
      -- and ps.measurement_unit = 'ms'
      and char_length(ps.test)-char_length(replace(ps.test,'/','')) = 1
      group by 1,2,3 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: push_timestamp {
    type: time
    sql: ${TABLE}.push_timestamp ;;
  }

  dimension: application {
    type: string
    sql: ${TABLE}.application ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: geomean_value {
    type: number
    sql: ${TABLE}.geomean_value ;;
  }

  set: detail {
    fields: [
        push_timestamp_time,
	application,
	platform,
	geomean_value
    ]
  }
}
