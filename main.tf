
data "template_file" "file" {
  template = "${file("./data.tpl")}"
  vars = {
    test =jsonencode("${local.Support_Request_Contributor.actions}")
  }
}

module "custom_roles" {
  for_each               = local.custom_role_definitions
  source                 = "./modules/azurerm-custom-role-definitions"
  custom_role_definition = each.value
}
