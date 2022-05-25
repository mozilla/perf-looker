view: backfill_report {
  sql_table_name: treeherder.backfill_report ;;

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

  dimension: frozen {
    type: yesno
    sql: ${TABLE}.frozen ;;
  }

  dimension_group: last_updated {
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
    sql: ${TABLE}.last_updated ;;
  }

  dimension: summary_id {
    type: number
    sql: ${TABLE}.summary_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
