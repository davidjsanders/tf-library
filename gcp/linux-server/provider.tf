provider "google" {
    credentials = file(format(
        "%s/%s",
        var.google-secrets.credentials-path,
        var.google-secrets.credentials-filename
    ))
    project     = var.google-project.project-id
    region      = var.google-project.region
}

provider "random" {}
provider "null" {}