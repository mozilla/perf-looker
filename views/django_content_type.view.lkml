view: django_content_type {
  sql_table_name: treeherder.django_content_type ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: app_label {
    type: string
    sql: ${TABLE}.app_label ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
