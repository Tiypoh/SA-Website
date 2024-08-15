#DNS

#Sebring Automotive
module "dns-sebringautomotive-shop" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "5.0"
  project_id = module.cs-seb-auto-website-vpc.project_id
  type       = "public"
  name       = "sebringautomotive-shop"
  domain     = "sebringautomotive.shop."

  private_visibility_config_networks = [
    "https://www.googleapis.com/compute/v1/projects/my-project/global/networks/my-vpc"
  ]
  enable_logging = true

  recordsets = [
    {
      name    = ""
      type    = "A"
      ttl     = 60
      records = [
        google_compute_address.sebringautomotive-ip.address,
      ]
    },
    {
      name    = "www"
      type    = "CNAME"
      ttl     = 300
      records = [
        "sebringautomotive.shop.",
      ]
    },
    {
      name    = ""
      type    = "SOA"
      ttl     = 21600
      records = [
        "ns-cloud-e1.googledomains.com. cloud-dns-hostmaster.google.com. 1 21600 3600 259200 300",
      ]
    },
    {
      name    = ""
      type    = "NS"
      ttl     = 21600
      records = [
        "ns-cloud-e1.googledomains.com.",
        "ns-cloud-e2.googledomains.com.",
        "ns-cloud-e3.googledomains.com.",
        "ns-cloud-e4.googledomains.com.",
      ]
    },
    {
      name    = ""
      type    = "MX"
      ttl     = 3600
      records = [
        "1 smtp.google.com.",
      ]
    },
    {
      name    = "uhdloqipga6b"
      type    = "CNAME"
      ttl     = 3600
      records = [
        "gv-tgpdrcszmo4gti.dv.googlehosted.com.",
      ]
    },
    {
      name    = "_8c58caea11d7888c48f4218748ba99ae"
      type    = "CNAME"
      ttl     = 3600
      records = [
        "daae2b4ef6348e3d623d8eb4884cda42.4ac3b9d0e8be144848ff8bccb539f4ae.190vu5r5bqrdzbx9u5fr.sectigo.com.",
      ]
    },
    {
      name    = "@"
      type    = "TXT"
      ttl     = 3600
      records = [
        "google-site-verification=lqz6TEh14V9z-NstlrOT5hVZ39xqZU3UzexVotIouqw",
      ]
    },
  ]
}

module "dns-sebringautomotivellc-com" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "5.0"
  project_id = module.cs-seb-auto-website-vpc.project_id
  type       = "public"
  name       = "sebringautomotivellc-com"
  domain     = "sebringautomotivellc.com."

  private_visibility_config_networks = [
    "https://www.googleapis.com/compute/v1/projects/my-project/global/networks/my-vpc"
  ]
  enable_logging = true

  recordsets = [
    {
      name    = ""
      type    = "A"
      ttl     = 60
      records = [
        google_compute_address.sebringautomotivellc-ip.address,
      ]
    },
    {
      name    = "www"
      type    = "CNAME"
      ttl     = 300
      records = [
        "sebringautomotivellc.com.",
      ]
    },
    {
      name    = ""
      type    = "SOA"
      ttl     = 21600
      records = [
        "ns-cloud-b1.googledomains.com. cloud-dns-hostmaster.google.com. 1 21600 3600 259200 300",
      ]
    },
    {
      name    = ""
      type    = "NS"
      ttl     = 21600
      records = [
        "ns-cloud-b1.googledomains.com.",
        "ns-cloud-b2.googledomains.com.",
        "ns-cloud-b3.googledomains.com.",
        "ns-cloud-b4.googledomains.com.",
      ]
    },
    {
      name    = ""
      type    = "MX"
      ttl     = 3600
      records = [
        "1 smtp.google.com.",
      ]
    },
    {
      name    = "_6850ca30459af649e04dab54ca9ca0f0"
      type    = "CNAME"
      ttl     = 3600
      records = [
        "45388e01d04663fdf031ef2060900015.c85f328c3ed538bed5293c42eecff8ff.idse555rv55rw5rf5rr5.sectigo.com.",
      ]
    },
  ]
}

#Bellas Gelato
module "dns-bellasgelato-com" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "5.0"
  project_id = module.cs-seb-auto-website-vpc.project_id
  type       = "public"
  name       = "bellasgelato-com"
  domain     = "bellasgelato.com."

  private_visibility_config_networks = [
    "https://www.googleapis.com/compute/v1/projects/my-project/global/networks/my-vpc"
  ]
  enable_logging = true

  recordsets = [
    {
      name    = ""
      type    = "A"
      ttl     = 60
      records = [
        google_compute_address.bellasgelato-ip.address,
      ]
    },
    {
      name    = "www"
      type    = "CNAME"
      ttl     = 300
      records = [
        "bellasgelato.com.",
      ]
    },
    {
      name    = ""
      type    = "SOA"
      ttl     = 21600
      records = [
        "ns-cloud-b1.googledomains.com. cloud-dns-hostmaster.google.com. 1 21600 3600 259200 300",
      ]
    },
    {
      name    = ""
      type    = "NS"
      ttl     = 21600
      records = [
        "ns-cloud-b1.googledomains.com.",
        "ns-cloud-b2.googledomains.com.",
        "ns-cloud-b3.googledomains.com.",
        "ns-cloud-b4.googledomains.com.",
      ]
    },
    {
      name    = ""
      type    = "MX"
      ttl     = 3600
      records = [
        "1 smtp.google.com.",
      ]
    },
    {
      name    = "ye4twl55ai2t"
      type    = "CNAME"
      ttl     = 3600
      records = [
        "gv-rgnfqhnadqwwoi.dv.googlehosted.com.",
      ]
    },
    {
      name    = "_a9ff067e1e7a179ee5d6bbaaead7c26f"
      type    = "CNAME"
      ttl     = 60
      records = [
        "a1cd175c5a9e26022d4812a7e49eb12a.b40b10b26b47fab3633703bb45226c53.d5dzb7ym55m7lx5c5j5o.sectigo.com.",
      ]
    },
  ]
}