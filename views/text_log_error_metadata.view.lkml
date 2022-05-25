view: text_log_error_metadata {
  sql_table_name: treeherder.text_log_error_metadata ;;

  dimension: best_classification_id {
    type: number
    sql: ${TABLE}.best_classification_id ;;
  }

  dimension: best_is_verified {
    type: yesno
    sql: ${TABLE}.best_is_verified ;;
  }

  dimension: failure_line_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.failure_line_id ;;
  }

  dimension: text_log_error_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.text_log_error_id ;;
  }

  measure: count {
    type: count
    drill_fields: [text_log_error.id, failure_line.id]
  }
}
