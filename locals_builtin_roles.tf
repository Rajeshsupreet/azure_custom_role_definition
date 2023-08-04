locals {
  Support_Request_Contributor = {
        actions = [
          "Microsoft.Authorization/*/read",
          "Microsoft.Resources/subscriptions/resourceGroups/read"
        ]

    notActions     = []
    dataActions    = []
    notDataActions = []
}
}