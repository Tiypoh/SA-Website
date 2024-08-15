# VPC and Subnets
module "cs-vpc-website-shared" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = module.cs-seb-auto-website-vpc.project_id
  network_name = "vpc-website-shared"

  subnets = [
    {
      subnet_name               = "subnet-website"
      subnet_ip                 = "10.0.0.0/10"
      subnet_region             = "us-west4"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    }
  ]

  firewall_rules = [
    {
      name      = "vpc-website-shared-allow-icmp"
      direction = "INGRESS"
      priority  = 10000
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
      allow = [
        {
          protocol = "icmp"
          ports    = []
        }
      ]
      ranges = [
        "10.128.0.0/9",
      ]
    },
    {
      name      = "vpc-website-shared-allow-rdp"
      direction = "INGRESS"
      priority  = 10000
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
      allow = [
        {
          protocol = "tcp"
          ports    = ["3389"]
        }
      ]
      ranges = [
        "35.235.240.0/20",
      ]
    },
    {
      name      = "vpc-website-shared-allow-ssh"
      direction = "INGRESS"
      priority  = 10000
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
      allow = [
        {
          protocol = "tcp"
          ports    = ["22"]
        }
      ]
      ranges = [
        "0.0.0.0/0",
      ]
    },
    {
      name      = "vpc-website-shared-allow-http"
      direction = "INGRESS"
      priority  = 1000
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
      allow = [
        {
          protocol = "tcp"
          ports    = ["80"]
        }
      ]
      ranges = [
        "0.0.0.0/0",
      ]
    },
    {
      name      = "vpc-website-shared-allow-https"
      direction = "INGRESS"
      priority  = 1000
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
      allow = [
        {
          protocol = "tcp"
          ports    = ["443"]
        }
      ]
      ranges = [
        "0.0.0.0/0",
      ]
    },
    {
      name      = "vpc-website-shared-allow-smtp"
      direction = "EGRESS"
      priority  = 1000
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
      allow = [
        {
          protocol = "tcp"
          ports    = ["587"]
        }
      ]
      ranges = [
        "0.0.0.0/0",
      ]
    },
  ]
}
