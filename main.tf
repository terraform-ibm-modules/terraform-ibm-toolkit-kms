locals {
  hpcs_kms = var.service == "hpcs"
  module = local.hpcs_kms ? module.hpcs : module.keyprotect
}

module "hpcs" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-hpcs.git?ref=v1.4.0"

  skip                   = !local.hpcs_kms
  resource_group_name    = var.resource_group_name
  region                 = var.region
  name_prefix            = var.name_prefix
  name                   = var.name
  provision              = var.provision
  ibmcloud_api_key       = var.ibmcloud_api_key
  number_of_crypto_units = var.number_of_crypto_units
}

module "keyprotect" {
  source = "github.com/ibm-garage-cloud/terraform-ibm-key-protect.git?ref=v2.2.1"

  skip                = local.hpcs_kms
  resource_group_name = var.resource_group_name
  region              = var.region
  name_prefix         = var.name_prefix
  name                = var.name
  provision           = var.provision
  ibmcloud_api_key    = var.ibmcloud_api_key
}
