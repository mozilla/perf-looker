view: commit {
  sql_table_name: treeherder.commit ;;
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

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: push_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.push_id ;;
  }

  dimension: revision {
    type: string
    sql: ${TABLE}.revision ;;
  }

  measure: count {
    type: count
    drill_fields: [id, push.id]
  }
}
