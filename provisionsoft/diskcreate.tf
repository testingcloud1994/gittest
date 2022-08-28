resource "google_compute_disk" "testme0diskcerate" {
    name = "testme-diskcerate"
    size = "80GB"
    type = "pd-ssd"
    zone = "${var.myzone}"
    physical_block_size_bytes = 4096
   
  
}