resource "google_compute_instance" "vm_instance" {
    name = "${var.vmname}"
    machine_type = "e2-micro"
       
    boot_disk {
      initialize_params{
        image= "ubuntu-os-cloud/ubuntu-2004-lts"
      }
          }
    metadata_startup_script ="ss.sh"
    network_interface {
      network= "default"
      access_config {
      
                  }
    }
}