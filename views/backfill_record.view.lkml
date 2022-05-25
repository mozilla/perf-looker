view: backfill_record {
  sql_table_name: treeherder.backfill_record ;;

  dimension: alert_id {
    type: number
    sql: ${TABLE}.alert_id ;;
  }

  dimension: context {
    type: string
    sql: ${TABLE}.context ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension: job_group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.job_group_id ;;
  }

  dimension: job_platform_option {
    type: string
    sql: ${TABLE}.job_platform_option ;;
  }

  dimension: job_tier {
    type: number
    sql: ${TABLE}.job_tier ;;
  }

  dimension: job_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.job_type_id ;;
  }

  dimension: log_details {
    type: string
    sql: ${TABLE}.log_details ;;
  }

  dimension: report_id {
    type: number
    sql: ${TABLE}.report_id ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: total_actions_triggered {
    type: number
    sql: ${TABLE}.total_actions_triggered ;;
  }

  dimension: total_backfills_failed {
    type: number
    sql: ${TABLE}.total_backfills_failed ;;
  }

  dimension: total_backfills_in_progress {
    type: number
    sql: ${TABLE}.total_backfills_in_progress ;;
  }

  dimension: total_backfills_successful {
    type: number
    sql: ${TABLE}.total_backfills_successful ;;
  }

  measure: count {
    type: count
    drill_fields: [job_type.id, job_type.name, job_group.id, job_group.name]
  }
}
