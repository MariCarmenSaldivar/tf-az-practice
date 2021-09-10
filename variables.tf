locals {
  # pattern_name = "${var.project_name}-${var.location}-${lower(substr(terraform.workspace, 0, 1))}"
  pattern_name= join("-",[var.project_name,var.location,lower(substr(terraform.workspace, 0, 1))])
}

variable "project_name" {
  type    = string
  default = "dou"
}

variable "location" {
  type    = string
  default = "eastus2"
}

# variable "functionsname" {
#   type=list(string)
#   default = [ "orderfunc", "productfunc" ]
# }

variable "functionsconfig" {
  type = list(object({
    name    = string,
    ostype  = string,
    pkgpath = string
  }))
}

variable "app_service_plan" {
  default = {
    dev  = "Standard"
    prod = "Premium"
  }
}