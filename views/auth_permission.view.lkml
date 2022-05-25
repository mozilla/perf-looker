view: auth_permission {
  sql_table_name: treeherder.auth_permission ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: codename {
    type: string
    sql: ${TABLE}.codename ;;
  }

  dimension: content_type_id {
    type: number
    sql: ${TABLE}.content_type_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, codename]
  }
}
