resource "google_compute_instance" "vm_instance" {
    name = "${var.vmname}"
    machine_type = "e2-micro"
       
    boot_disk {
      initialize_params{
        image= "ubuntu-os-cloud/ubuntu-2004-lts"
      }
          }
    network_interface {
      network= "default"
      access_config {
      
                  }
    }
}

output "instance" {
  value = google_compute_instance.vm_instance.name
  sensitive = false
}
