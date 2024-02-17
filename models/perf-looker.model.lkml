connection: "perfherder_mysql"
label: "Firefox Performance"

# include all the views
include: "/views/**/*.view"

# datagroup: perf-looker_default_datagroup {
#   # sql_trigger: SELECT MAX(id) FROM etl_log;;
#   max_cache_age: "1 hour"
# }

# persist_with: perf-looker_default_datagroup

# explore: auth_group {}

# explore: auth_group_permissions {
#   join: group {
#     type: left_outer
#     sql_on: ${auth_group_permissions.group_id} = ${group.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: auth_permission {}

# explore: auth_user {}

# explore: auth_user_groups {
#   join: group {
#     type: left_outer
#     sql_on: ${auth_user_groups.group_id} = ${group.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: auth_user_user_permissions {}

explore: backfill_notification_record {}

explore: backfill_record {
  join: job_type {
    type: left_outer
    sql_on: ${backfill_record.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: job_group {
    type: left_outer
    sql_on: ${backfill_record.job_group_id} = ${job_group.id} ;;
    relationship: many_to_one
  }
}

explore: backfill_report {}

explore: bugscache {}

explore: bugzilla_component {}

explore: bugzilla_security_group {}

explore: bug_job_map {
  join: job {
    type: left_outer
    sql_on: ${bug_job_map.job_id} = ${job.id} ;;
    relationship: many_to_one
  }

  join: repository {
    type: left_outer
    sql_on: ${job.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${job.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: build_platform {
    type: left_outer
    sql_on: ${job.build_platform_id} = ${build_platform.id} ;;
    relationship: many_to_one
  }

  join: failure_classification {
    type: left_outer
    sql_on: ${job.failure_classification_id} = ${failure_classification.id} ;;
    relationship: many_to_one
  }

  join: job_type {
    type: left_outer
    sql_on: ${job.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: machine {
    type: left_outer
    sql_on: ${job.machine_id} = ${machine.id} ;;
    relationship: many_to_one
  }

  join: machine_platform {
    type: left_outer
    sql_on: ${job.machine_platform_id} = ${machine_platform.id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${job.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: job_group {
    type: left_outer
    sql_on: ${job.job_group_id} = ${job_group.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: build_platform {}

explore: changelog_entry {}

explore: changelog_file {}

explore: classified_failure {}

explore: commit {
  join: push {
    type: left_outer
    sql_on: ${commit.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: repository {
    type: left_outer
    sql_on: ${push.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: django_content_type {}

explore: django_migrations {}

explore: failure_classification {}

explore: failure_line {
  join: repository {
    type: left_outer
    sql_on: ${failure_line.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: job_log {
    type: left_outer
    sql_on: ${failure_line.job_log_id} = ${job_log.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }

  join: job {
    type: left_outer
    sql_on: ${job_log.job_id} = ${job.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${job.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: build_platform {
    type: left_outer
    sql_on: ${job.build_platform_id} = ${build_platform.id} ;;
    relationship: many_to_one
  }

  join: failure_classification {
    type: left_outer
    sql_on: ${job.failure_classification_id} = ${failure_classification.id} ;;
    relationship: many_to_one
  }

  join: job_type {
    type: left_outer
    sql_on: ${job.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: machine {
    type: left_outer
    sql_on: ${job.machine_id} = ${machine.id} ;;
    relationship: many_to_one
  }

  join: machine_platform {
    type: left_outer
    sql_on: ${job.machine_platform_id} = ${machine_platform.id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${job.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: job_group {
    type: left_outer
    sql_on: ${job.job_group_id} = ${job_group.id} ;;
    relationship: many_to_one
  }
}

explore: file_bugzilla_component {
  join: bugzilla_component {
    type: left_outer
    sql_on: ${file_bugzilla_component.bugzilla_component_id} = ${bugzilla_component.id} ;;
    relationship: many_to_one
  }
}

explore: group {}

explore: group_status {
  join: group {
    type: left_outer
    sql_on: ${group_status.group_id} = ${group.id} ;;
    relationship: many_to_one
  }

  join: job_log {
    type: left_outer
    sql_on: ${group_status.job_log_id} = ${job_log.id} ;;
    relationship: many_to_one
  }

  join: job {
    type: left_outer
    sql_on: ${job_log.job_id} = ${job.id} ;;
    relationship: many_to_one
  }

  join: repository {
    type: left_outer
    sql_on: ${job.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${job.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: build_platform {
    type: left_outer
    sql_on: ${job.build_platform_id} = ${build_platform.id} ;;
    relationship: many_to_one
  }

  join: failure_classification {
    type: left_outer
    sql_on: ${job.failure_classification_id} = ${failure_classification.id} ;;
    relationship: many_to_one
  }

  join: job_type {
    type: left_outer
    sql_on: ${job.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: machine {
    type: left_outer
    sql_on: ${job.machine_id} = ${machine.id} ;;
    relationship: many_to_one
  }

  join: machine_platform {
    type: left_outer
    sql_on: ${job.machine_platform_id} = ${machine_platform.id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${job.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: job_group {
    type: left_outer
    sql_on: ${job.job_group_id} = ${job_group.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: investigated_tests {
  join: job_type {
    type: left_outer
    sql_on: ${investigated_tests.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${investigated_tests.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: repository {
    type: left_outer
    sql_on: ${push.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: issue_tracker {}

explore: job {
  join: repository {
    type: left_outer
    sql_on: ${job.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${job.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: build_platform {
    type: left_outer
    sql_on: ${job.build_platform_id} = ${build_platform.id} ;;
    relationship: many_to_one
  }

  join: failure_classification {
    type: left_outer
    sql_on: ${job.failure_classification_id} = ${failure_classification.id} ;;
    relationship: many_to_one
  }

  join: job_type {
    type: left_outer
    sql_on: ${job.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: machine {
    type: left_outer
    sql_on: ${job.machine_id} = ${machine.id} ;;
    relationship: many_to_one
  }

  join: machine_platform {
    type: left_outer
    sql_on: ${job.machine_platform_id} = ${machine_platform.id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${job.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: job_group {
    type: left_outer
    sql_on: ${job.job_group_id} = ${job_group.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: job_group {}

explore: job_log {
  join: job {
    type: left_outer
    sql_on: ${job_log.job_id} = ${job.id} ;;
    relationship: many_to_one
  }

  join: repository {
    type: left_outer
    sql_on: ${job.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${job.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: build_platform {
    type: left_outer
    sql_on: ${job.build_platform_id} = ${build_platform.id} ;;
    relationship: many_to_one
  }

  join: failure_classification {
    type: left_outer
    sql_on: ${job.failure_classification_id} = ${failure_classification.id} ;;
    relationship: many_to_one
  }

  join: job_type {
    type: left_outer
    sql_on: ${job.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: machine {
    type: left_outer
    sql_on: ${job.machine_id} = ${machine.id} ;;
    relationship: many_to_one
  }

  join: machine_platform {
    type: left_outer
    sql_on: ${job.machine_platform_id} = ${machine_platform.id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${job.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: job_group {
    type: left_outer
    sql_on: ${job.job_group_id} = ${job_group.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: job_note {
  join: failure_classification {
    type: left_outer
    sql_on: ${job_note.failure_classification_id} = ${failure_classification.id} ;;
    relationship: many_to_one
  }

  join: job {
    type: left_outer
    sql_on: ${job_note.job_id} = ${job.id} ;;
    relationship: many_to_one
  }

  join: repository {
    type: left_outer
    sql_on: ${job.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${job.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: build_platform {
    type: left_outer
    sql_on: ${job.build_platform_id} = ${build_platform.id} ;;
    relationship: many_to_one
  }

  join: job_type {
    type: left_outer
    sql_on: ${job.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: machine {
    type: left_outer
    sql_on: ${job.machine_id} = ${machine.id} ;;
    relationship: many_to_one
  }

  join: machine_platform {
    type: left_outer
    sql_on: ${job.machine_platform_id} = ${machine_platform.id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${job.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: job_group {
    type: left_outer
    sql_on: ${job.job_group_id} = ${job_group.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: job_type {}

explore: machine {}

explore: machine_platform {}

explore: mozci_classification {
  join: push {
    type: left_outer
    sql_on: ${mozci_classification.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: repository {
    type: left_outer
    sql_on: ${push.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: option {}

explore: option_collection {
  join: option {
    type: left_outer
    sql_on: ${option_collection.option_id} = ${option.id} ;;
    relationship: many_to_one
  }
}

explore: performance_alert {}

explore: performance_alert_summary {
  join: repository {
    type: left_outer
    sql_on: ${performance_alert_summary.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${performance_alert_summary.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: issue_tracker {
    type: left_outer
    sql_on: ${performance_alert_summary.issue_tracker_id} = ${issue_tracker.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: performance_bug_template {}

explore: performance_datum {
  join: repository {
    type: left_outer
    sql_on: ${performance_datum.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: performance_signature {
    type: left_outer
    sql_on: ${performance_datum.signature_id} = ${performance_signature.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${performance_datum.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: job {
    type: left_outer
    sql_on: ${performance_datum.job_id} = ${job.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }

  join: build_platform {
    type: left_outer
    sql_on: ${job.build_platform_id} = ${build_platform.id} ;;
    relationship: many_to_one
  }

  join: failure_classification {
    type: left_outer
    sql_on: ${job.failure_classification_id} = ${failure_classification.id} ;;
    relationship: many_to_one
  }

  join: job_type {
    type: left_outer
    sql_on: ${job.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: machine {
    type: left_outer
    sql_on: ${job.machine_id} = ${machine.id} ;;
    relationship: many_to_one
  }

  join: machine_platform {
    type: left_outer
    sql_on: ${job.machine_platform_id} = ${machine_platform.id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${job.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: job_group {
    type: left_outer
    sql_on: ${job.job_group_id} = ${job_group.id} ;;
    relationship: many_to_one
  }
}

explore: performance_framework {}

explore: performance_settings {}

explore: performance_signature {
  join: option_collection {
    type: left_outer
    sql_on: ${performance_signature.option_collection_id} = ${option_collection.id} ;;
    relationship: many_to_one
  }

  join: repository {
    type: left_outer
    sql_on: ${performance_signature.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: option {
    type: left_outer
    sql_on: ${option_collection.option_id} = ${option.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: performance_tag {}

explore: performance_tag_alert_summaries {}

explore: perf_multicommitdatum {}

explore: product {}

explore: push {
  join: repository {
    type: left_outer
    sql_on: ${push.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: reference_data_signatures {}

explore: repository {
  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: repository_group {}

explore: taskcluster_metadata {
  join: job {
    type: left_outer
    sql_on: ${taskcluster_metadata.job_id} = ${job.id} ;;
    relationship: many_to_one
  }

  join: repository {
    type: left_outer
    sql_on: ${job.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${job.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: build_platform {
    type: left_outer
    sql_on: ${job.build_platform_id} = ${build_platform.id} ;;
    relationship: many_to_one
  }

  join: failure_classification {
    type: left_outer
    sql_on: ${job.failure_classification_id} = ${failure_classification.id} ;;
    relationship: many_to_one
  }

  join: job_type {
    type: left_outer
    sql_on: ${job.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: machine {
    type: left_outer
    sql_on: ${job.machine_id} = ${machine.id} ;;
    relationship: many_to_one
  }

  join: machine_platform {
    type: left_outer
    sql_on: ${job.machine_platform_id} = ${machine_platform.id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${job.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: job_group {
    type: left_outer
    sql_on: ${job.job_group_id} = ${job_group.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: text_log_error {
  join: job {
    type: left_outer
    sql_on: ${text_log_error.job_id} = ${job.id} ;;
    relationship: many_to_one
  }

  join: repository {
    type: left_outer
    sql_on: ${job.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${job.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: build_platform {
    type: left_outer
    sql_on: ${job.build_platform_id} = ${build_platform.id} ;;
    relationship: many_to_one
  }

  join: failure_classification {
    type: left_outer
    sql_on: ${job.failure_classification_id} = ${failure_classification.id} ;;
    relationship: many_to_one
  }

  join: job_type {
    type: left_outer
    sql_on: ${job.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: machine {
    type: left_outer
    sql_on: ${job.machine_id} = ${machine.id} ;;
    relationship: many_to_one
  }

  join: machine_platform {
    type: left_outer
    sql_on: ${job.machine_platform_id} = ${machine_platform.id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${job.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: job_group {
    type: left_outer
    sql_on: ${job.job_group_id} = ${job_group.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: text_log_error_match {
  join: classified_failure {
    type: left_outer
    sql_on: ${text_log_error_match.classified_failure_id} = ${classified_failure.id} ;;
    relationship: many_to_one
  }

  join: text_log_error {
    type: left_outer
    sql_on: ${text_log_error_match.text_log_error_id} = ${text_log_error.id} ;;
    relationship: many_to_one
  }

  join: job {
    type: left_outer
    sql_on: ${text_log_error.job_id} = ${job.id} ;;
    relationship: many_to_one
  }

  join: repository {
    type: left_outer
    sql_on: ${job.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${job.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: build_platform {
    type: left_outer
    sql_on: ${job.build_platform_id} = ${build_platform.id} ;;
    relationship: many_to_one
  }

  join: failure_classification {
    type: left_outer
    sql_on: ${job.failure_classification_id} = ${failure_classification.id} ;;
    relationship: many_to_one
  }

  join: job_type {
    type: left_outer
    sql_on: ${job.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: machine {
    type: left_outer
    sql_on: ${job.machine_id} = ${machine.id} ;;
    relationship: many_to_one
  }

  join: machine_platform {
    type: left_outer
    sql_on: ${job.machine_platform_id} = ${machine_platform.id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${job.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: job_group {
    type: left_outer
    sql_on: ${job.job_group_id} = ${job_group.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}

explore: text_log_error_metadata {
  join: text_log_error {
    type: left_outer
    sql_on: ${text_log_error_metadata.text_log_error_id} = ${text_log_error.id} ;;
    relationship: many_to_one
  }

  join: failure_line {
    type: left_outer
    sql_on: ${text_log_error_metadata.failure_line_id} = ${failure_line.id} ;;
    relationship: many_to_one
  }

  join: job {
    type: left_outer
    sql_on: ${text_log_error.job_id} = ${job.id} ;;
    relationship: many_to_one
  }

  join: repository {
    type: left_outer
    sql_on: ${job.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${job.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: build_platform {
    type: left_outer
    sql_on: ${job.build_platform_id} = ${build_platform.id} ;;
    relationship: many_to_one
  }

  join: failure_classification {
    type: left_outer
    sql_on: ${job.failure_classification_id} = ${failure_classification.id} ;;
    relationship: many_to_one
  }

  join: job_type {
    type: left_outer
    sql_on: ${job.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: machine {
    type: left_outer
    sql_on: ${job.machine_id} = ${machine.id} ;;
    relationship: many_to_one
  }

  join: machine_platform {
    type: left_outer
    sql_on: ${job.machine_platform_id} = ${machine_platform.id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${job.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: job_group {
    type: left_outer
    sql_on: ${job.job_group_id} = ${job_group.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }

  join: job_log {
    type: left_outer
    sql_on: ${failure_line.job_log_id} = ${job_log.id} ;;
    relationship: many_to_one
  }
}

explore: text_log_step {
  join: job {
    type: left_outer
    sql_on: ${text_log_step.job_id} = ${job.id} ;;
    relationship: many_to_one
  }

  join: repository {
    type: left_outer
    sql_on: ${job.repository_id} = ${repository.id} ;;
    relationship: many_to_one
  }

  join: push {
    type: left_outer
    sql_on: ${job.push_id} = ${push.id} ;;
    relationship: many_to_one
  }

  join: build_platform {
    type: left_outer
    sql_on: ${job.build_platform_id} = ${build_platform.id} ;;
    relationship: many_to_one
  }

  join: failure_classification {
    type: left_outer
    sql_on: ${job.failure_classification_id} = ${failure_classification.id} ;;
    relationship: many_to_one
  }

  join: job_type {
    type: left_outer
    sql_on: ${job.job_type_id} = ${job_type.id} ;;
    relationship: many_to_one
  }

  join: machine {
    type: left_outer
    sql_on: ${job.machine_id} = ${machine.id} ;;
    relationship: many_to_one
  }

  join: machine_platform {
    type: left_outer
    sql_on: ${job.machine_platform_id} = ${machine_platform.id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${job.product_id} = ${product.id} ;;
    relationship: many_to_one
  }

  join: job_group {
    type: left_outer
    sql_on: ${job.job_group_id} = ${job_group.id} ;;
    relationship: many_to_one
  }

  join: repository_group {
    type: left_outer
    sql_on: ${repository.repository_group_id} = ${repository_group.id} ;;
    relationship: many_to_one
  }
}
