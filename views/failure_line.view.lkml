view: failure_line {
  sql_table_name: treeherder.failure_line ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: best_classification_id {
    type: number
    sql: ${TABLE}.best_classification_id ;;
  }

  dimension: best_is_verified {
    type: yesno
    sql: ${TABLE}.best_is_verified ;;
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

  dimension: expected {
    type: string
    sql: ${TABLE}.expected ;;
  }

  dimension: job_guid {
    type: string
    sql: ${TABLE}.job_guid ;;
  }

  dimension: job_log_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.job_log_id ;;
  }

  dimension: level {
    type: string
    sql: ${TABLE}.level ;;
  }

  dimension: line {
    type: number
    sql: ${TABLE}.line ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension_group: modified {
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
    sql: ${TABLE}.modified ;;
  }

  dimension: repository_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.repository_id ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
  }

  dimension: stack {
    type: string
    sql: ${TABLE}.stack ;;
  }

  dimension: stackwalk_stderr {
    type: string
    sql: ${TABLE}.stackwalk_stderr ;;
  }

  dimension: stackwalk_stdout {
    type: string
    sql: ${TABLE}.stackwalk_stdout ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subtest {
    type: string
    sql: ${TABLE}.subtest ;;
  }

  dimension: test {
    type: string
    sql: ${TABLE}.test ;;
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
      job_log.id,
      job_log.name,
      text_log_error_metadata.count
    ]
  }
}
