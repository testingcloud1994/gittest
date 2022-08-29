
resource "google_compute_instance_group" "webserver" {
  name = "webserver"
  description = "this is my webserver test"
  instances = [ google_compute_instance.vm_instance.id ]
  health_check=[google_compute_http_health_check.httphealth.id]
  named_port {
    name= "http"
    port= "80"
  }
  zone= "${var.myzone}"
  
lifecycle {
  create_before_destroy=true
}
}



resource "google_compute_instance" "vm_instance" {
    name = "${var.vmname}"
    machine_type = "e2-micro"
       
   /* attached_disk {
      source=google_compute_disk.testme0diskcerate.id
    }*/
    boot_disk {
      source = google_compute_disk.testme0diskcerate.id
      /*initialize_params{
      size = 150
      image= "ubuntu-os-cloud/ubuntu-2004-lts"
      }*/
    }
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
output "instance" {
  value = google_compute_disk.testme0diskcerate
  sensitive = false
}
