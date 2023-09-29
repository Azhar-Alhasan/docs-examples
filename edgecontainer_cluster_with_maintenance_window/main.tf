resource "google_edgecontainer_cluster" "default" {
  name = "cluster-with-maintenance-${local.name_suffix}"
  location = "us-central1"

  authorization {
    admin_users {
      username = "admin@hashicorptest.com"
    }
  }

  networking {
    cluster_ipv4_cidr_blocks = ["10.0.0.0/16"]
    services_ipv4_cidr_blocks = ["10.1.0.0/16"]
  }

  fleet {
    project = "projects/${data.google_project.project.number}"
  }

  maintenance_policy {
    window {
      recurring_window {
        window {
          start_time = "2023-01-01T08:00:00Z"
          end_time = "2023-01-01T17:00:00Z"
        }

        recurrence = "FREQ=WEEKLY;BYDAY=SA"
      }
    }
  }
}

data "google_project" "project" {}
