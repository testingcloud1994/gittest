resource "google_compute_network" "testme-network" {
project = "testme"
name = "testme-network"
auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "testme-subnet" {
    name = "testme-subnet"
    ip_cidr_range = "192.168.1.0/22"
    region = "${var.myregion}"
    network = google_compute_network.testme-network 
}