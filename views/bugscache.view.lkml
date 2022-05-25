view: bugscache {
  sql_table_name: treeherder.bugscache ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: crash_signature {
    type: string
    sql: ${TABLE}.crash_signature ;;
  }

  dimension: dupe_of {
    type: number
    sql: ${TABLE}.dupe_of ;;
  }

  dimension: keywords {
    type: string
    sql: ${TABLE}.keywords ;;
  }

  dimension_group: modified {
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
    sql: ${TABLE}.modified ;;
  }

  dimension: processed_update {
    type: yesno
    sql: ${TABLE}.processed_update ;;
  }

  dimension: resolution {
    type: string
    sql: ${TABLE}.resolution ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
  }

  dimension: whiteboard {
    type: string
    sql: ${TABLE}.whiteboard ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
