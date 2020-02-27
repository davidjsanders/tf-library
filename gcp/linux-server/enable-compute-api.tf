resource "google_project_service" "compute-engine-api" {
    disable_on_destroy = false
    project            = var.google-project.project-id
    service            = "compute.googleapis.com"
}