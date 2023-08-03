view: job_type {
  sql_table_name: treeherder.job_type ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.symbol ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, backfill_record.count, investigated_tests.count, job.count]
  }
}
