view: auth_group_permissions {
  sql_table_name: treeherder.auth_group_permissions ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: permission_id {
    type: number
    sql: ${TABLE}.permission_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, group.id, group.name]
  }
}
