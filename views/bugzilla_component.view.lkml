view: bugzilla_component {
  sql_table_name: treeherder.bugzilla_component ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: component {
    type: string
    sql: ${TABLE}.component ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  measure: count {
    type: count
    drill_fields: [id, file_bugzilla_component.count]
  }
}
