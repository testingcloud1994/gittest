provider "google" {
    project = "intense-acumen-357607"
    region = "us-central1"
    zone = "us-central1-c"
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
    name= "mytestnetwork"
    access_config {
      
    }
  

}



  
}