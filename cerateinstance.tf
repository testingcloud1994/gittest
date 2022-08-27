provider "google" {
    credentials = "cred.json"
    project = "intense-acumen-357607"
    region = "us-west4"
    zone = "us-west4-b"
    
}

resource "google_compute_instance" "vm_instance" {
    name = "terraform_instance"
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