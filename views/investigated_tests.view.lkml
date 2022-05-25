view: investigated_tests {
  sql_table_name: treeherder.investigated_tests ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: job_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.job_type_id ;;
  }

  dimension: push_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.push_id ;;
  }

  dimension: test {
    type: string
    sql: ${TABLE}.test ;;
  }

  measure: count {
    type: count
    drill_fields: [id, job_type.id, job_type.name, push.id]
  }
}
