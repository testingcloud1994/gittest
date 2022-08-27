resource "google_compute_instance" "vm_instance" {
    count = 3
    name = "myinstance"
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