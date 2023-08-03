view: text_log_error {
  sql_table_name: treeherder.text_log_error ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: job_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.job_id ;;
  }

  dimension: line {
    type: string
    sql: ${TABLE}.line ;;
  }

  dimension: line_number {
    type: number
    sql: ${TABLE}.line_number ;;
  }

  dimension: step_id {
    type: number
    sql: ${TABLE}.step_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, job.id, text_log_error_match.count, text_log_error_metadata.count]
  }
}
