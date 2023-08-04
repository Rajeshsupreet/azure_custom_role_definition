variable "custom_role_definition" {
  type = object({
    name              = string
    description       = string
    scope             = string
    assignable_scopes = list(string)
   
    permissions = object({
      actions        = list(string)
      notActions     = list(string)
      dataActions    = list(string)
      notDataActions = list(string)
      })
    })
}