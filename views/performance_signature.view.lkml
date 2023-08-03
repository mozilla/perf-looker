view: performance_signature {
  sql_table_name: treeherder.performance_signature ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: alert_change_type {
    type: number
    sql: ${TABLE}.alert_change_type ;;
  }

  dimension: alert_threshold {
    type: number
    sql: ${TABLE}.alert_threshold ;;
  }

  dimension: application {
    type: string
    sql: ${TABLE}.application ;;
  }

  dimension: extra_options {
    type: string
    sql: ${TABLE}.extra_options ;;
  }

  dimension: fore_window {
    type: number
    sql: ${TABLE}.fore_window ;;
  }

  dimension: framework_id {
    type: number
    sql: ${TABLE}.framework_id ;;
  }

  dimension: has_subtests {
    type: yesno
    sql: ${TABLE}.has_subtests ;;
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

  dimension: lower_is_better {
    type: yesno
    sql: ${TABLE}.lower_is_better ;;
  }

  dimension: max_back_window {
    type: number
    sql: ${TABLE}.max_back_window ;;
  }

  dimension: measurement_unit {
    type: string
    sql: ${TABLE}.measurement_unit ;;
  }

  dimension: min_back_window {
    type: number
    sql: ${TABLE}.min_back_window ;;
  }

  dimension: option_collection_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.option_collection_id ;;
  }

  dimension: parent_signature_id {
    type: number
    sql: ${TABLE}.parent_signature_id ;;
  }

  dimension: platform_id {
    type: number
    sql: ${TABLE}.platform_id ;;
  }

  dimension: repository_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.repository_id ;;
  }

  dimension: should_alert {
    type: yesno
    sql: ${TABLE}.should_alert ;;
  }

  dimension: signature_hash {
    type: string
    sql: ${TABLE}.signature_hash ;;
  }

  dimension: suite {
    type: string
    sql: ${TABLE}.suite ;;
  }

  dimension: suite_public_name {
    type: string
    sql: ${TABLE}.suite_public_name ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: test {
    type: string
    sql: ${TABLE}.test ;;
  }

  dimension: test_public_name {
    type: string
    sql: ${TABLE}.test_public_name ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      suite_public_name,
      test_public_name,
      option_collection.id,
      repository.id,
      repository.name
    ]
  }
}
