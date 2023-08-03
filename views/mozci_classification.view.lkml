view: mozci_classification {
  sql_table_name: treeherder.mozci_classification ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created ;;
  }

  dimension: push_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.push_id ;;
  }

  dimension: result {
    type: string
    sql: ${TABLE}.result ;;
  }

  dimension: task_id {
    type: string
    sql: ${TABLE}.task_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, push.id]
  }
}
