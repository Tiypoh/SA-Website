module "cs-projects-iam-loggingviewer" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 7.4"

  projects = [
    module.cs-seb-auto-logs.project_id,
  ]
  bindings = {
    "roles/logging.viewer" = [
      "group:gcp-logging-viewers@sebringautomotive.shop",
    ]
    "roles/logging.privateLogViewer" = [
      "group:gcp-logging-viewers@sebringautomotive.shop",
    ]
    "roles/bigquery.dataViewer" = [
      "group:gcp-logging-viewers@sebringautomotive.shop",
      "group:gcp-security-admins@sebringautomotive.shop",
    ]
    "roles/pubsub.viewer" = [
      "group:gcp-logging-viewers@sebringautomotive.shop",
      "group:gcp-security-admins@sebringautomotive.shop",
    ]
  }
}

module "cs-service-projects-iam-computeinstanceAdminv1" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 7.4"

  projects = [
    module.cs-svc-ws-sebringautomotive.project_id,
	module.cs-seb-auto-website-vpc.project_id,
  ]
  bindings = {
    "roles/compute.instanceAdmin.v1" = [
      "group:${module.cs-gg-website.id}",
    ]
  }
}

resource "google_service_account" "sa-website" {
  account_id      = "website-service"
  display_name    = "Website Service"
  project         = module.cs-svc-ws-sebringautomotive.project_id
}

module "cs-service-account-website" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 7.4"

  projects = [
    module.cs-svc-ws-sebringautomotive.project_id,
	module.cs-seb-auto-website-vpc.project_id,
  ]
  bindings = {
    "roles/compute.admin" = [
      "serviceAccount:website-service@ws-sebringautomotive.iam.gserviceaccount.com",
    ]
	"roles/iam.serviceAccountUser" = [
      "serviceAccount:website-service@ws-sebringautomotive.iam.gserviceaccount.com",
    ]
  }
}
resource "google_service_account" "sa-website-bg" {
  account_id      = "website-service"
  display_name    = "Website Service BG"
  project         = module.cs-svc-ws-bellasgelato.project_id
}

module "cs-service-account-website-bg" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 7.4"

  projects = [
    module.cs-svc-ws-bellasgelato.project_id,
	module.cs-seb-auto-website-vpc.project_id,
  ]
  bindings = {
    "roles/compute.admin" = [
      "serviceAccount:website-service@ws-bellasgelato.iam.gserviceaccount.com",
    ]
	"roles/iam.serviceAccountUser" = [
      "serviceAccount:website-service@ws-bellasgelato.iam.gserviceaccount.com",
    ]
  }
}