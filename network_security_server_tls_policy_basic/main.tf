resource "google_network_security_server_tls_policy" "default" {
  provider               = google-beta
  name                   = "my-server-tls-policy-${local.name_suffix}"
  labels                 = {
    foo = "bar"
  }
  description            = "my description"
  allow_open             = "false"
  server_certificate {
    certificate_provider_instance {
        plugin_instance = "google_cloud_private_spiffe"
      }
  }
  mtls_policy {
    client_validation_ca {
      grpc_endpoint {
        target_uri = "unix:mypath"
      }
    }
    client_validation_ca {
      grpc_endpoint {
        target_uri = "unix:abc/mypath"
      }
    }
    client_validation_ca {
      certificate_provider_instance {
        plugin_instance = "google_cloud_private_spiffe"
      }
    }
  }
}
