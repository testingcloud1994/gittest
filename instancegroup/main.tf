
resource "google_compute_instance_group_manager" "webserver" {
  name = "webserver"
  description = "this is my webserver test"
  version {
    instance_template=google_compute_instance_template.vm_instance.id
  }

  target_pools = [google_compute_target_pool.webpool.id]
  target_size  = 2
  named_port {
    name= "http"
    port= "80"
  }
  zone= "${var.myzone}"

  auto_healing_policies {
    health_check      = google_compute_http_health_check.httphealth.id
    initial_delay_sec = 300
  }
}



resource "google_compute_instance_template" "vm_instance" {
    name = "${var.vmname}"
    machine_type = "e2-micro"
    disk {
    source      = "ubuntu-os-cloud/ubuntu-2004-lts"
    auto_delete = false
    boot        = false
       }
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
