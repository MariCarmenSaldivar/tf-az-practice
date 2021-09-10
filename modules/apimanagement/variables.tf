variable "apim_name" {
    type = string
    description = "Api managemet name"
}

variable "location" {
    type = string
    description = "Location"
}

variable "rg" {
    type = string
    description = "resource group"
}

variable "sku" {
    type = string
    description = "Is a string consisting of two parts separated by an underscore(_). The first part is the name, the second part is the capacity (e.g. the number of deployed units of the sku)"
}