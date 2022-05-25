view: push {
  sql_table_name: treeherder.push ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: author {
    type: string
    sql: ${TABLE}.author ;;
  }

  dimension: repository_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.repository_id ;;
  }

  dimension: revision {
    type: string
    sql: ${TABLE}.revision ;;
  }

  dimension_group: time {
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
    sql: ${TABLE}.time ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      repository.id,
      repository.name,
      commit.count,
      investigated_tests.count,
      job.count,
      mozci_classification.count,
      performance_alert_summary.count,
      performance_datum.count
    ]
  }
}
