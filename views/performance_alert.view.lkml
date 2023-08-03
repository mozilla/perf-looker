view: performance_alert {
  sql_table_name: treeherder.performance_alert ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount_abs {
    type: number
    sql: ${TABLE}.amount_abs ;;
  }

  dimension: amount_pct {
    type: number
    sql: ${TABLE}.amount_pct ;;
  }

  dimension: classifier_id {
    type: number
    sql: ${TABLE}.classifier_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension_group: first_triaged {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_triaged ;;
  }

  dimension: is_regression {
    type: yesno
    sql: ${TABLE}.is_regression ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: manually_created {
    type: yesno
    sql: ${TABLE}.manually_created ;;
  }

  dimension: new_value {
    type: number
    sql: ${TABLE}.new_value ;;
  }

  dimension: noise_profile {
    type: string
    sql: ${TABLE}.noise_profile ;;
  }

  dimension: prev_value {
    type: number
    sql: ${TABLE}.prev_value ;;
  }

  dimension: related_summary_id {
    type: number
    sql: ${TABLE}.related_summary_id ;;
  }

  dimension: series_signature_id {
    type: number
    sql: ${TABLE}.series_signature_id ;;
  }

  dimension: starred {
    type: yesno
    sql: ${TABLE}.starred ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: summary_id {
    type: number
    sql: ${TABLE}.summary_id ;;
  }

  dimension: t_value {
    type: number
    sql: ${TABLE}.t_value ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
