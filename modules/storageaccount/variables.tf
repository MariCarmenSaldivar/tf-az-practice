variable "stname" {
    type = string
    description = "Name of storage account"
    validation {
      condition =length(var.stname) > 8
      error_message = "The string must be more than 8 caracteres "
    }
}  

variable "rg" {
    type = string
    description = "Resource group name"
}

variable "location" {
    type = string
    description = "Azure region id"
}

variable "tier" {
    type = string
    description = " Tier to use for this storage account: Standard, Premium etc"
}
  
variable "identity_type" {
    type = string
    description = "Specifies the identity type of the Storage Account"
}

# variable "identity_ids" {
#     type = list(object({
#         principal_id=string
#         tenant_id =string
#     }))
#     description = "(optional) describe your variable"
# }

variable "replication_type" {
  type=string
  description="Defines the type of replication to use for this storage account."
}