view: performance_bug_template {
  sql_table_name: treeherder.performance_bug_template ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cc_list {
    type: string
    sql: ${TABLE}.cc_list ;;
  }

  dimension: default_component {
    type: string
    sql: ${TABLE}.default_component ;;
  }

  dimension: default_product {
    type: string
    sql: ${TABLE}.default_product ;;
  }

  dimension: framework_id {
    type: number
    sql: ${TABLE}.framework_id ;;
  }

  dimension: keywords {
    type: string
    sql: ${TABLE}.keywords ;;
  }

  dimension: status_whiteboard {
    type: string
    sql: ${TABLE}.status_whiteboard ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
