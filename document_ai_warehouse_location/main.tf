resource "google_document_ai_warehouse_location" "example" {
    location = "us"
    project_number = data.google_project.project.number
    access_control_mode = "ACL_MODE_DOCUMENT_LEVEL_ACCESS_CONTROL_GCI"
    database_type = "DB_INFRA_SPANNER"
    kms_key = "dummy_key"
    document_creator_default_role = "DOCUMENT_ADMIN"
}

data "google_project" "project" {
}
