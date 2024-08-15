module "cs-seb-auto-website-vpc" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.2"

  name       = "website-vpc"
  project_id = "seb-auto-website-vpc"
  org_id     = var.org_id
  folder_id  = module.cs-envs.ids["Website"]

  billing_account                = var.billing_account
  enable_shared_vpc_host_project = true
  
  activate_apis = [
	"compute.googleapis.com",
    "domains.googleapis.com",
	"dns.googleapis.com",
	"oslogin.googleapis.com",
	"cloudaicompanion.googleapis.com",
  ]
}

module "cs-seb-auto-logs" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.2"

  name       = "logging"
  project_id = "seb-auto-logs"
  org_id     = var.org_id
  folder_id  = module.cs-common.id

  billing_account = var.billing_account
  
  activate_apis = [
    "compute.googleapis.com",
    "logging.googleapis.com",
	"oslogin.googleapis.com",
  ]
}