view: changelog_entry {
  sql_table_name: treeherder.changelog_entry ;;
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

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}.owner ;;
  }

  dimension: project {
    type: string
    sql: ${TABLE}.project ;;
  }

  dimension: project_url {
    type: string
    sql: ${TABLE}.project_url ;;
  }

  dimension: remote_id {
    type: string
    sql: ${TABLE}.remote_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
