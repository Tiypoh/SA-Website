#Static IP
resource "google_compute_address" "sebringautomotive-ip" {
  name         = "sebringautomotive-ip"
  region       = "us-west4"
  address_type = "EXTERNAL"
  project      = module.cs-svc-ws-sebringautomotive.project_id
}
resource "google_compute_address" "sebringautomotivellc-ip" {
  name         = "sebringautomotivellc-ip"
  region       = "us-west4"
  address_type = "EXTERNAL"
  project      = module.cs-svc-ws-sebringautomotive.project_id
}
resource "google_compute_address" "bellasgelato-ip" {
  name         = "bellasgelato-ip"
  region       = "us-west4"
  address_type = "EXTERNAL"
  project      = module.cs-svc-ws-bellasgelato.project_id
}
#VM
resource "google_compute_instance" "ws-sebringautomotive" {
  project = module.cs-svc-ws-sebringautomotive.project_id
  
  boot_disk {
	auto_delete = true
	device_name = "ws-sebringautomotive"

	initialize_params {
	  image = "projects/debian-cloud/global/images/debian-12-bookworm-v20240415"
	  size  = 10
	  type  = "pd-balanced"
	}

	mode = "READ_WRITE"
  }

  can_ip_forward      = true
  deletion_protection = true
  enable_display      = true

  labels = {
	goog-ec-src           = "vm_add-tf"
	goog-ops-agent-policy = "v2-x86-template-1-2-0"
  }

  machine_type = "f1-micro"

  metadata = {
	enable-osconfig = "FALSE"
    enable-oslogin  = "FALSE"
    "ssh-keys"      = <<EOF
      root:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0FeQdcdJYv8ei+uSDfI7IDn8PAMOWCIycK7mo+IvjCaYDdSrz+wXEMM9EfsRlN5k1kOOwTuG8aJfWGVGBC0UPuI3J0mXpO5U7ki1UI6u9OZx3Ew1ixjZtW7YwjLz+FRUVqJ0rYd0BjdOE2ezgGV18Psw15bdiP/n5nYQQCEf+XdxYZ/ia4HTOV3mp0R1U9SOwjbxfBxo+5JXyosjUPMbcWQ9v3wcOi9W+xmNhgH/LX7D6KB4Pb2896TxOIk4uXNRIz1UxK+pCGFYI5jhqB+GjXA2EbYmPaIIOksEHeqFaSHRHvpwLfudqZyXhXD7B0QcMqsT1iR6MEkO/YbAzCEN/
      kylesebring:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9irjHfjMNqY8vkAfrg0PRREAqWoojjAmJfh6YUxMU46/R61PEBj0hhvtj2SMFbzPGXPH6DiXB4shuoqV0oEYRbS9xAuAm/P1Ck9igiKb0pv+VzIhXzIzciKfQ9pR4hqHUxKvjQVeyX4NJ87JYnj1ofTC/4M7+5CFtutdTIt9iKc0Y06ujdC73jtu2dYoevx357MhMMPxYmuI/fOeeiNLkAxuHonY5XK52iVxg48ZOZUE+N4EfxgwNLXyQOlrQiaOWvRkehkGrclm4KX+FZCzLE4QygTuB4hh41qaMMtRBaKCTmQK8aWYS3e+RaZz2KT+NT8U+Cn8XrHT3bMLSDs8D
    EOF
  }

  name = "ws-sebringautomotive"

  network_interface {
	access_config {
	  nat_ip                 = google_compute_address.sebringautomotive-ip.address
	  network_tier           = "PREMIUM"
	  public_ptr_domain_name = "sebringautomotive.shop."
	}

	nic_type    = "GVNIC"
	queue_count = 0
	stack_type  = "IPV4_ONLY"
	subnetwork  = "projects/${module.cs-seb-auto-website-vpc.project_id}/regions/us-west4/subnetworks/subnet-website"
  }

  scheduling {
	automatic_restart   = true
	on_host_maintenance = "MIGRATE"
	preemptible         = false
	provisioning_model  = "STANDARD"
  }

  service_account {
	email  = "website-service@ws-sebringautomotive.iam.gserviceaccount.com"
	scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
	enable_integrity_monitoring = true
	enable_secure_boot          = false
	enable_vtpm                 = true
  }

  zone = "us-west4-a"
}

#VM beta
resource "google_compute_instance" "ws-sebringautomotivellc" {
  project = module.cs-svc-ws-sebringautomotive.project_id
  
  boot_disk {
	auto_delete = true
	device_name = "ws-sebringautomotivellc"

	initialize_params {
	  image = "projects/debian-cloud/global/images/debian-12-bookworm-v20240415"
	  size  = 10
	  type  = "pd-balanced"
	}

	mode = "READ_WRITE"
  }

  can_ip_forward      = true
  deletion_protection = true
  enable_display      = true

  labels = {
	goog-ec-src           = "vm_add-tf"
	goog-ops-agent-policy = "v2-x86-template-1-2-0"
  }

  machine_type = "f1-micro"

  metadata = {
	enable-osconfig = "TRUE"
    enable-oslogin  = "FALSE"
    "ssh-keys"      = <<EOF
      root:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCQG0dFzyGK5kKlKmdfy1zeEgRj3qCks1JGCPut9nvfURQfn+xElRdKqvkmTl2Jl5zDxzt5uYejVUKxYPrxK/cky3K+nP0qqsMtCUADJAaYs+Kywh8uAAXAfWmZ7y/N5BvbKMP+Cs258U6J3A3Db8/59kLopxrnTN3Nm1MeNcAv13M6aI3JVNOOllAl40+6+GvAp2gbWScY2uVJVJ4iOLn+eXuHZiCV9jPoQZuus22fc9iXKw/sPjEFGFZDPcDk2xu+YmHNpDWAvjWgsgZnF+hqKgRko0zq37VieYcWw6CMyg+kppe66cVhdhldY8RMlhCD044DsJcUfqrUA0/+v5bf
      kylesebring:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9irjHfjMNqY8vkAfrg0PRREAqWoojjAmJfh6YUxMU46/R61PEBj0hhvtj2SMFbzPGXPH6DiXB4shuoqV0oEYRbS9xAuAm/P1Ck9igiKb0pv+VzIhXzIzciKfQ9pR4hqHUxKvjQVeyX4NJ87JYnj1ofTC/4M7+5CFtutdTIt9iKc0Y06ujdC73jtu2dYoevx357MhMMPxYmuI/fOeeiNLkAxuHonY5XK52iVxg48ZOZUE+N4EfxgwNLXyQOlrQiaOWvRkehkGrclm4KX+FZCzLE4QygTuB4hh41qaMMtRBaKCTmQK8aWYS3e+RaZz2KT+NT8U+Cn8XrHT3bMLSDs8D
    EOF
  }

  name = "ws-sebringautomotivellc"

  network_interface {
	access_config {
	  nat_ip                 = google_compute_address.sebringautomotivellc-ip.address
	  network_tier           = "PREMIUM"
	  public_ptr_domain_name = "sebringautomotivellc.com."
	}

	nic_type    = "GVNIC"
	queue_count = 0
	stack_type  = "IPV4_ONLY"
	subnetwork  = "projects/${module.cs-seb-auto-website-vpc.project_id}/regions/us-west4/subnetworks/subnet-website"
  }

  scheduling {
	automatic_restart   = true
	on_host_maintenance = "MIGRATE"
	preemptible         = false
	provisioning_model  = "STANDARD"
  }

  service_account {
	email  = "website-service@ws-sebringautomotive.iam.gserviceaccount.com"
	scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
	enable_integrity_monitoring = true
	enable_secure_boot          = false
	enable_vtpm                 = true
  }

  zone = "us-west4-a"
}

#VM Bellas Gelato
resource "google_compute_instance" "ws-bellasgelato" {
  project = module.cs-svc-ws-bellasgelato.project_id
  
  boot_disk {
	auto_delete = true
	device_name = "ws-bellasgelato"

	initialize_params {
	  image = "projects/debian-cloud/global/images/debian-12-bookworm-v20240415"
	  size  = 10
	  type  = "pd-balanced"
	}

	mode = "READ_WRITE"
  }

  can_ip_forward      = true
  deletion_protection = true
  enable_display      = true

  labels = {
	goog-ec-src           = "vm_add-tf"
	goog-ops-agent-policy = "v2-x86-template-1-2-0"
  }

  machine_type = "f1-micro"

  metadata = {
	enable-osconfig = "TRUE"
    enable-oslogin  = "FALSE"
    "ssh-keys"      = <<EOF
      root:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCJr1epcDggw80j2o0Wgw1t9mWy/4zCXqGc3gmfeo+3nmS04o1tm75hnc0hG8crrul41Ql+EKxJTAF98CsBOhe0RalxJHWltr29W3pPdTg742I3asN5xlRnnzsogBBqqQ4zxqZ4mo1wHI6W2RS7cKm7J28ASbXrrL4ctpCSEdUhiu6r9Cm9zkWuoPZ5Y8ycEEA+Y7nBdzT2IHu2PUV0pIM/V3FwoJm4HWucWqrAscRZwpjmWrpoit8mRfq0ReWP3cffF20ydns6S6y1bVhq/XU5E4T1urOWFR/a37KcmiPaYmLGeJQaa7zN1L/7oQyPbOfb8sTVWQS59fENNNkV2L4R
      kylesebring:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9irjHfjMNqY8vkAfrg0PRREAqWoojjAmJfh6YUxMU46/R61PEBj0hhvtj2SMFbzPGXPH6DiXB4shuoqV0oEYRbS9xAuAm/P1Ck9igiKb0pv+VzIhXzIzciKfQ9pR4hqHUxKvjQVeyX4NJ87JYnj1ofTC/4M7+5CFtutdTIt9iKc0Y06ujdC73jtu2dYoevx357MhMMPxYmuI/fOeeiNLkAxuHonY5XK52iVxg48ZOZUE+N4EfxgwNLXyQOlrQiaOWvRkehkGrclm4KX+FZCzLE4QygTuB4hh41qaMMtRBaKCTmQK8aWYS3e+RaZz2KT+NT8U+Cn8XrHT3bMLSDs8D
    EOF
  }

  name = "ws-bellasgelato"

  network_interface {
	access_config {
	  nat_ip                 = google_compute_address.bellasgelato-ip.address
	  network_tier           = "PREMIUM"
	  public_ptr_domain_name = "bellasgelato.com."
	}

	nic_type    = "GVNIC"
	queue_count = 0
	stack_type  = "IPV4_ONLY"
	subnetwork  = "projects/${module.cs-seb-auto-website-vpc.project_id}/regions/us-west4/subnetworks/subnet-website"
  }

  scheduling {
	automatic_restart   = true
	on_host_maintenance = "MIGRATE"
	preemptible         = false
	provisioning_model  = "STANDARD"
  }

  service_account {
	email  = "website-service@ws-bellasgelato.iam.gserviceaccount.com"
	scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
	enable_integrity_monitoring = true
	enable_secure_boot          = false
	enable_vtpm                 = true
  }

  zone = "us-west4-a"
}