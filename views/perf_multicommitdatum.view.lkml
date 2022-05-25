view: perf_multicommitdatum {
  sql_table_name: treeherder.perf_multicommitdatum ;;

  dimension: perf_datum_id {
    type: number
    sql: ${TABLE}.perf_datum_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
