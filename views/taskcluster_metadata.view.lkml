view: taskcluster_metadata {
  sql_table_name: treeherder.taskcluster_metadata ;;

  dimension: job_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.job_id ;;
  }

  dimension: retry_id {
    type: number
    sql: ${TABLE}.retry_id ;;
  }

  dimension: task_id {
    type: string
    sql: ${TABLE}.task_id ;;
  }

  measure: count {
    type: count
    drill_fields: [job.id]
  }
}
