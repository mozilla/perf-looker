view: text_log_step {
  sql_table_name: treeherder.text_log_step ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: finished {
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
    sql: ${TABLE}.finished ;;
  }

  dimension: finished_line_number {
    type: number
    sql: ${TABLE}.finished_line_number ;;
  }

  dimension: job_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.job_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: result {
    type: number
    sql: ${TABLE}.result ;;
  }

  dimension_group: started {
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
    sql: ${TABLE}.started ;;
  }

  dimension: started_line_number {
    type: number
    sql: ${TABLE}.started_line_number ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, job.id]
  }
}
