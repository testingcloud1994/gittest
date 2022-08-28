variable "myregion" {
    default = "us-west4" 
}
variable "vmname" {
     type = string
     description = "this is conditional exception"
     validation {
       condition = contains(["a","b"],lower(var.vmname))
       error_message = "only allowed name is a or b . please insert allowed values "   
     }
    }
variable "myzone" {
     default = "us-west4-b"  
}

variable "machine_type" {
    default = "e2.micro"
}
variable "environment" {
     default = "uat"
}

  variable "pathtopublickey" {
    default = "keyvalue.pub"
  }
  variable "pathtoprivatekey" {
    default = "keyvalue"
      }