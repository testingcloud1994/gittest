resource "google_compute_disk" "testme0diskcerate" {
    name = "testme-diskcerate"
    size = "80Gb"
    type = "pd-ssd"
    zone = "${var.myzone}"
    physical_block_size_bytes = 4096
   
  
}