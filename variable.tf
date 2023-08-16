variable users {
  type        = map(string)
  description "Map to define Users : KEY = Display Name/VALUE = UserPrincipalName"
}

variable password {
    type = string
    description = "Password applied to all users"
}
