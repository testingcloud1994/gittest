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
