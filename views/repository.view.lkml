view: repository {
  sql_table_name: treeherder.repository ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: active_status {
    type: string
    sql: ${TABLE}.active_status ;;
  }

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }

  dimension: codebase {
    type: string
    sql: ${TABLE}.codebase ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: dvcs_type {
    type: string
    sql: ${TABLE}.dvcs_type ;;
  }

  dimension: expire_performance_data {
    type: yesno
    sql: ${TABLE}.expire_performance_data ;;
  }

  dimension: is_try_repo {
    type: yesno
    sql: ${TABLE}.is_try_repo ;;
  }

  dimension: life_cycle_order {
    type: number
    sql: ${TABLE}.life_cycle_order ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: performance_alerts_enabled {
    type: yesno
    sql: ${TABLE}.performance_alerts_enabled ;;
  }

  dimension: repository_group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.repository_group_id ;;
  }

  dimension: tc_root_url {
    type: string
    sql: ${TABLE}.tc_root_url ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      repository_group.id,
      repository_group.name,
      failure_line.count,
      job.count,
      performance_alert_summary.count,
      performance_datum.count,
      performance_signature.count,
      push.count
    ]
  }
}
