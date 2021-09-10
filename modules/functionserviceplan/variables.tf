variable "location" {
  type = string
}

variable "sku_tier" {
  type = string
}

variable "sku_size" {
  type = string
}

variable "rg" {
  type = string
}

variable "plan_name" {
  type = string
}

variable "kind" {
  type        = string
  description = " The kind of the App Service Plan to create. "
}