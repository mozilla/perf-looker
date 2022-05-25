view: bugzilla_security_group {
  sql_table_name: treeherder.bugzilla_security_group ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: security_group {
    type: string
    sql: ${TABLE}.security_group ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
