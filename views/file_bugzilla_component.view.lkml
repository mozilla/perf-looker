view: file_bugzilla_component {
  sql_table_name: treeherder.file_bugzilla_component ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bugzilla_component_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.bugzilla_component_id ;;
  }

  dimension: file_name {
    type: string
    sql: ${TABLE}.file_name ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  measure: count {
    type: count
    drill_fields: [id, file_name, bugzilla_component.id]
  }
}
