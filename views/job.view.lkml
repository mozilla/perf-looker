view: job {
  sql_table_name: treeherder.job ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: autoclassify_status {
    type: number
    sql: ${TABLE}.autoclassify_status ;;
  }

  dimension: build_platform_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.build_platform_id ;;
  }

  dimension: coalesced_to_guid {
    type: string
    sql: ${TABLE}.coalesced_to_guid ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_time ;;
  }

  dimension: failure_classification_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.failure_classification_id ;;
  }

  dimension: guid {
    type: string
    sql: ${TABLE}.guid ;;
  }

  dimension: job_group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.job_group_id ;;
  }

  dimension: job_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.job_type_id ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.last_modified ;;
  }

  dimension: machine_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.machine_id ;;
  }

  dimension: machine_platform_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.machine_platform_id ;;
  }

  dimension: option_collection_hash {
    type: string
    sql: ${TABLE}.option_collection_hash ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: project_specific_id {
    type: number
    sql: ${TABLE}.project_specific_id ;;
  }

  dimension: push_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.push_id ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: repository_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.repository_id ;;
  }

  dimension: result {
    type: string
    sql: ${TABLE}.result ;;
  }

  dimension: running_eta {
    type: number
    sql: ${TABLE}.running_eta ;;
  }

  dimension: signature_id {
    type: number
    sql: ${TABLE}.signature_id ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_time ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension_group: submit {
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
    sql: ${TABLE}.submit_time ;;
  }

  dimension: tier {
    type: number
    sql: ${TABLE}.tier ;;
  }

  dimension: who {
    type: string
    sql: ${TABLE}.who ;;
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
      push.id,
      build_platform.id,
      build_platform.os_name,
      failure_classification.id,
      failure_classification.name,
      job_type.id,
      job_type.name,
      machine.id,
      machine.name,
      machine_platform.id,
      machine_platform.os_name,
      product.id,
      product.name,
      job_group.id,
      job_group.name,
      bug_job_map.count,
      job_log.count,
      job_note.count,
      performance_datum.count,
      taskcluster_metadata.count,
      text_log_error.count,
      text_log_step.count
    ]
  }
}
