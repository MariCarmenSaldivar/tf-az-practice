variable "rg" {
  type = string
}

variable "location" {
  type = string
}

variable "plan_service" {
  type = string
}

variable "stname" {
  description = "Name of storage account to save logs of the appfunction"
}

variable "identity_type" {
  type = string
}

# variable "identity_ids" {
#     type = list(string)
#     description = "(optional) describe your variable"
# }

# variable "identity_ids" {
#     type = list(object({
#         principal_id=string
#         tenant_id =string
#     }))
#     description = "(optional) describe your variable"
# }

# variable "principal_id" {
#     type = string
#     description = "The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. "
# }
# variable "storageId" {
#     type = string
#     description = "id of the storage account to save the logs"
# }

variable "stkey" {
  type = string
}
variable "os_type" {
  type = string
}

variable "name" {
  type = string
}

variable "pkgpath" {
  type = string
}