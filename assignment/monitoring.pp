node 'monitoring.dev.net'{
  include prometheus::node_exporter
  include prometheus::alertmanager
  class { 'prometheus::server':
    node_exporter_targets => $prometheus_scrape_targets,
  }
  class { 'prometheus::blackbox_exporter':
  }
}
