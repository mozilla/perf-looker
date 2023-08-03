view: performance_datum {
  sql_table_name: treeherder.performance_datum ;;
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

  dimension: push_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.push_id ;;
  }

  dimension_group: push_timestamp {
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
    sql: ${TABLE}.push_timestamp ;;
  }

  dimension: repository_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.repository_id ;;
  }

  dimension: signature_id {
    type: number
    sql: ${TABLE}.signature_id ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [id, repository.id, repository.name, push.id, job.id]
  }
}
