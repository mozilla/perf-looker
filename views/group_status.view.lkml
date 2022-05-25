view: group_status {
  sql_table_name: treeherder.group_status ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: job_log_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.job_log_id ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [id, group.id, group.name, job_log.id, job_log.name]
  }
}
