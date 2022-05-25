view: performance_settings {
  sql_table_name: treeherder.performance_settings ;;
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

  dimension: settings {
    type: string
    sql: ${TABLE}.settings ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
