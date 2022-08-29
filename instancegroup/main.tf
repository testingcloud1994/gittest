
resource "google_compute_instance_group_manager" "webserver" {
  name = "webserver"
  description = "this is my webserver test"
  base_instance_name = "webservertest"
  zone= "${var.myzone}"
  version {
    instance_template=google_compute_instance_template.vm_instance.id
  }

  target_pools = [google_compute_target_pool.webpool.id]
  target_size  = 2
  named_port {
    name= "http"
    port= "80"
  }
  

  auto_healing_policies {
    health_check      = google_compute_http_health_check.httphealth.id
    initial_delay_sec = 300
  }
}



resource "google_compute_instance_template" "vm_instance" {
    name = "${var.vmname}"
    machine_type = "e2-micro"
    disk {
    source_image= "ubuntu-os-cloud/ubuntu-2004-lts"
    auto_delete = false
    boot        = false
       }

gce-software-declaration = <<-EOF
    {
      "softwareRecipes": [{
        "name": "install-webserver",
        "desired_state": "INSTALLED",
        "installSteps": [{
          "scriptRun": {
            "script": "#! /bin/bash\n sudo apt-get update \n sudo apt-get upgrate \n sudo app-get install -y nginx"
          }
        }]
      }]
    }
    EOF

    /*boot_disk {
      source = google_compute_disk.testme0diskcerate.id
    }*/
    network_interface {
      subnetwork = google_compute_subnetwork.testme-subnet.name
      access_config {
      
                  }
    }
}



output "instance" {
  value = google_compute_subnetwork.testme-subnet.name
  sensitive = false
}
output "disk_info" {
  value = google_compute_disk.testme0diskcerate
  sensitive = false
}
