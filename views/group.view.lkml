view: group {
  sql_table_name: treeherder.`group` ;;
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

  measure: count {
    type: count
    drill_fields: [id, name, auth_group_permissions.count, auth_user_groups.count, group_status.count]
  }
}
