view: issue_tracker {
  sql_table_name: treeherder.issue_tracker ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: task_base_url {
    type: string
    sql: ${TABLE}.task_base_url ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, performance_alert_summary.count]
  }
}
