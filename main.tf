module "users" {
  source = "./modules/users"
}

module "profile" {
  source = "./modules/profile"

  users = module.users.defs

  profiles = {
    "3" = {
      location = "osaka"
    }
    "4" = {
      location = "tokyo"
    }
  }
}
