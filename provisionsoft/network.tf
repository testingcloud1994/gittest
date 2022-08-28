resource "google_compute_network" "testme-network" {
name = "testme-network"
auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "testme-subnet" {
    name = "testme-subnet"
    ip_cidr_range = "192.168.0.0/16"
    region = "${var.myregion}"
    network = google_compute_network.testme-network.id
    secondary_ip_range {
        range_name="testsecondaryiprange"
        ip_cidr_range = "192.168.10.0/24"
    }
}