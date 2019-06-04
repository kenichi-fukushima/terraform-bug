variable "users" {
  type = list(object({
    id       = string
    name     = string
  }))
}

variable "profiles" {
  type = map
}
