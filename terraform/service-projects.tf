module "cs-svc-ws-sebringautomotive" {
  source  = "terraform-google-modules/project-factory/google//modules/svpc_service_project"
  version = "~> 14.2"

  name            = "website"
  project_id      = "ws-sebringautomotive"
  org_id          = var.org_id
  billing_account = var.billing_account
  folder_id       = module.cs-envs.ids["Website"]

  shared_vpc = module.cs-vpc-website-shared.project_id
  shared_vpc_subnets = [
    try(module.cs-vpc-website-shared.subnets["us-west4/subnet-website"].self_link, ""),
  ]

  domain     = data.google_organization.org.domain
  group_name = module.cs-gg-website.name
  group_role = "roles/viewer"
  
  activate_apis = [
    "cloudresourcemanager.googleapis.com",
	"compute.googleapis.com",
	"iam.googleapis.com",
	"iamcredentials.googleapis.com",
	"oslogin.googleapis.com",
	"serviceusage.googleapis.com",
	"cloudaicompanion.googleapis.com",
  ]
}
module "cs-svc-ws-bellasgelato" {
  source  = "terraform-google-modules/project-factory/google//modules/svpc_service_project"
  version = "~> 14.2"

  name            = "website-bg"
  project_id      = "ws-bellasgelato"
  org_id          = var.org_id
  billing_account = var.billing_account
  folder_id       = module.cs-envs.ids["Website"]

  shared_vpc = module.cs-vpc-website-shared.project_id
  shared_vpc_subnets = [
    try(module.cs-vpc-website-shared.subnets["us-west4/subnet-website"].self_link, ""),
  ]

  domain     = data.google_organization.org.domain
  group_name = module.cs-gg-website.name
  group_role = "roles/viewer"
  
  activate_apis = [
    "cloudresourcemanager.googleapis.com",
	"compute.googleapis.com",
	"iam.googleapis.com",
	"iamcredentials.googleapis.com",
	"oslogin.googleapis.com",
	"serviceusage.googleapis.com",
	"cloudaicompanion.googleapis.com",
  ]
}