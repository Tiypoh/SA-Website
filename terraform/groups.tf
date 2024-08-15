# In order to create google groups, the calling identity should have at least the
# Group Admin role in Google Admin. More info: https://support.google.com/a/answer/2405986
#Accounts and Groups

module "cs-gg-website" {
  source  = "terraform-google-modules/group/google"
  version = "~> 0.6"

  id           = "website@sebringautomotive.shop"
  display_name = "website"
  customer_id  = data.google_organization.org.directory_customer_id
  types = [
    "default",
    "security",
  ]
}