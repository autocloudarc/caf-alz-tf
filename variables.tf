# Replace the highlighted text with the subscription IDs that you will use during this lab and save the file.
# For single subscription deployment, use same ID for every subscription ID.

variable "root_id" {
  type    = string
  default = "commure"
}

variable "root_name" {
  type    = string
  default = "Commure"
}

variable "managementSubscriptionId" {
  type    = string
  default = "8719a04e-a344-4341-9099-c45f8153c2ad"
}

variable "connectivitySubscriptionId" {
  type    = string
  default = "4bb98c4e-07ce-43f4-9bdc-1db578ebb6b5"
}

variable "identitySubscriptionId" {
  type    = string
  default = "1a0b75c6-fadb-4a1b-9f59-3037cf745d67"
}

variable "uslzSubscriptionId" {
  type    = string
  default = "ac0cac16-64f5-40bb-9d17-c0c92633d8d2"
}

variable "sandboxSubscriptionId" {
  type    = string
  default = "282b7bda-a835-4429-a125-7a32256f4f97"
}

variable "primary_location" {
  type    = string
  default = "eastus2"
}

variable "deploy_management_resources" {
  type    = bool
  default = true
}

variable "management_resources_location" {
  type    = string
  default = "eastus2"
}

variable "management_resources_tags" {
  type = map(string)
  default = {
    BelongsTo = "Platform-Infra"
  }

}
variable "log_retention_in_days" {
  type    = number
  default = 360
}

variable "security_alerts_email_address" {
  type    = string
  default = "platform-infra@commure.com"
}

variable "deploy_connectivity_resources" {
  type    = bool
  default = true
}

variable "connectivity_resources_location" {
  type    = string
  default = "eastus2"
}

variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    BelongsTo = "Platform-Infra"
  }
}