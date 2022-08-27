resource "google_compute_instance" "vm_instance" 
{
    name = "${var.vmname}"
    machine_type = "e2-micro"
       
    boot_disk {
      initialize_params{
        image= "ubuntu-os-cloud/ubuntu-2004-lts"
      }
          }
    metadata = {
      "key" = file("${var.pathtopublickey}")
    }
    metadata_startup_script ="apt-get update && apt-get install nginx"
        
    network_interface 
    {
      network= "default"
      access_config {
      nat_ip="${var.securitygp[0]}"
                  }
    }
  
}