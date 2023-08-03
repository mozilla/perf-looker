view: text_log_error_match {
  sql_table_name: treeherder.text_log_error_match ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: classified_failure_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.classified_failure_id ;;
  }

  dimension: matcher_name {
    type: string
    sql: ${TABLE}.matcher_name ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: text_log_error_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.text_log_error_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, matcher_name, classified_failure.id, text_log_error.id]
  }
}
