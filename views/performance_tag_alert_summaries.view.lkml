view: performance_tag_alert_summaries {
  sql_table_name: treeherder.performance_tag_alert_summaries ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: performancealertsummary_id {
    type: number
    sql: ${TABLE}.performancealertsummary_id ;;
  }

  dimension: performancetag_id {
    type: number
    sql: ${TABLE}.performancetag_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
