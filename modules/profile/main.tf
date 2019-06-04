locals {
  defaults = {
    location = "unknown"
  }
  profiles = [for u in var.users : contains(keys(var.profiles), u.id) ? merge(local.defaults, var.profiles[u.id]) : local.defaults]
}

data "template_file" "config_content" {
  count = length(var.users)

  template = "name = $${name} location = $${location}"

  vars = {
    name    = var.users[count.index].name
    location = (local.profiles[count.index].location)
  }
}

resource "local_file" "config_file" {
  count = length(var.users)

  content  = data.template_file.config_content[count.index].rendered
  filename = "./output/user${count.index}.txt"
}
