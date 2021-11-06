module "kms" {
  source = "./module"

  service             = var.service
  resource_group_name = module.resource_group.name
  region              = var.region
  name_prefix         = var.name_prefix
  provision           = true
}

resource null_resource print_names {
  provisioner "local-exec" {
    command = "echo -n '${module.kms.name}' > .resourcename"
  }
  provisioner "local-exec" {
    command = "echo -n '${module.kms.id}' > .resourceid"
  }
  provisioner "local-exec" {
    command = "echo -n '${module.kms.service}' > .resourceservice"
  }
  provisioner "local-exec" {
    command = "echo -n '${var.service}' > .inputservice"
  }
}
