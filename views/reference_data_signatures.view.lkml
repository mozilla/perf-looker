view: reference_data_signatures {
  sql_table_name: treeherder.reference_data_signatures ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: build_architecture {
    type: string
    sql: ${TABLE}.build_architecture ;;
  }

  dimension: build_os_name {
    type: string
    sql: ${TABLE}.build_os_name ;;
  }

  dimension: build_platform {
    type: string
    sql: ${TABLE}.build_platform ;;
  }

  dimension: build_system_type {
    type: string
    sql: ${TABLE}.build_system_type ;;
  }

  dimension: first_submission_timestamp {
    type: number
    sql: ${TABLE}.first_submission_timestamp ;;
  }

  dimension: job_group_name {
    type: string
    sql: ${TABLE}.job_group_name ;;
  }

  dimension: job_group_symbol {
    type: string
    sql: ${TABLE}.job_group_symbol ;;
  }

  dimension: job_type_name {
    type: string
    sql: ${TABLE}.job_type_name ;;
  }

  dimension: job_type_symbol {
    type: string
    sql: ${TABLE}.job_type_symbol ;;
  }

  dimension: machine_architecture {
    type: string
    sql: ${TABLE}.machine_architecture ;;
  }

  dimension: machine_os_name {
    type: string
    sql: ${TABLE}.machine_os_name ;;
  }

  dimension: machine_platform {
    type: string
    sql: ${TABLE}.machine_platform ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: option_collection_hash {
    type: string
    sql: ${TABLE}.option_collection_hash ;;
  }

  dimension: repository {
    type: string
    sql: ${TABLE}.repository ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
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
      build_os_name,
      machine_os_name,
      job_group_name,
      job_type_name
    ]
  }
}
