resource "google_compute_disk" "testme0diskcerate" {
    name = "testme-diskcerate"
    size =  80
    type = "pd-ssd"
    zone = "${var.myzone}"
    image = "ubuntu-os-cloud/ubuntu-2004-lts"
    physical_block_size_bytes = 4096
   
  
}