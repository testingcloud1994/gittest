resource "google_compute_instance_template" "events_service_template" {
  name = "servicetemplate"
  machine_type = "e2.micro"
  can_ip_forward = false

  tags = []

  disk {
    source_image = "ubuntu-os-cloud/ubuntu-1404-lts"
    disk_type = "pd-ssd"
    disk_size_gb = "30"
    auto_delete = true
    boot = true
  }

  network_interface {
    network = "default"
  }

  metadata {
   # ssh-keys = "root:${file("${var.public_key_path}")}"
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/compute.readonly"]
  }

  provisioner "file" {
    source = "scripts/startup.sh"
    destination = "/root/startup.sh"

    connection {
      type = "ssh"
      user = "root"
    #  private_key = "${file("${var.private_key_path}")}"
      agent = false
    }
  }

  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "root"
    #  private_key = "${file("${var.private_key_path}")}"
      agent = false
    }

    inline = [
      "chmod +x /root/startup.sh",
      "/root/startup.sh"
    ]
  }
}



/*resource "google_compute_instance" "vm_instance" {
    name = "${var.vmname}"
    machine_type = "e2-micro"
       
    boot_disk {
      initialize_params{
        image= "ubuntu-os-cloud/ubuntu-2004-lts"
      }
          }
    metadata = {
      enable-oslogin = "TRUE"
    }
    metadata_startup_script ="apache.sh "
        
    network_interface {
      network= "default"
      access_config {
      
                  }
    }
}*/