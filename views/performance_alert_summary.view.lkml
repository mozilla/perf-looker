view: performance_alert_summary {
  sql_table_name: treeherder.performance_alert_summary ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: assignee_id {
    type: number
    sql: ${TABLE}.assignee_id ;;
  }

  dimension: bug_number {
    type: number
    sql: ${TABLE}.bug_number ;;
  }

  dimension_group: bug_updated {
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
    sql: ${TABLE}.bug_updated ;;
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

  dimension: framework_id {
    type: number
    sql: ${TABLE}.framework_id ;;
  }

  dimension: issue_tracker_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.issue_tracker_id ;;
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

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: prev_push_id {
    type: number
    sql: ${TABLE}.prev_push_id ;;
  }

  dimension: push_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.push_id ;;
  }

  dimension: repository_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.repository_id ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      repository.id,
      repository.name,
      push.id,
      issue_tracker.id,
      issue_tracker.name
    ]
  }
}
