
provider "google" {
    credentials = "cred.json"
    project = "intense-acumen-357607"
    region = "${var.myregion}"
    zone = "${var.myzone}"
}