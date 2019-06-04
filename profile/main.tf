module "users" {
  source = "../modules/users"
}

module "profile" {
  source = "../modules/profile"

  users = module.users.defs

  profiles = {
    "4" = {
      location = "tokyo"
    }
  }
}
