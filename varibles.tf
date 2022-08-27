variable "myregion" {
    default = "us-west4" 
}
variable "myzone" {
     default = "us-west4-b"  
}
variable "securitygp" {
    type = list
    name=["a","b","c","d","e","f","g","h"]  
}