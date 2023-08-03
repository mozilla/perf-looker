view: option_collection {
  sql_table_name: treeherder.option_collection ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: option_collection_hash {
    type: string
    sql: ${TABLE}.option_collection_hash ;;
  }

  dimension: option_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.option_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, option.id, option.name, performance_signature.count]
  }
}
