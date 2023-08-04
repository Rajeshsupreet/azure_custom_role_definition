# Lookup the subscription where the custom roles should be defined to.

data "azurerm_subscription" "current" {}

locals {

  custom_role_definitions = {

    nonprod-Administrator = {
      name        = "nonprod-Administrator"
      description = "Custom Role that assigns SCR to Azure Portal and Log Analytics Reader"
      scope       = data.azurerm_subscription.current.id

      permissions = {
        actions = [
          //Support Request Contributor start
          //"Microsoft.Authorization/*/read",
          //"Microsoft.Resources/subscriptions/resourceGroups/read",
          //"Microsoft.Support/*",
          // Support Request Contributor End 
          # jsonencode(data.template_file.file.rendered),
          "${data.template_file.file.rendered}",
          //Log Analytics Reader Start
          "*/read",
          "Microsoft.OperationalInsights/workspaces/analytics/query/action",
          "Microsoft.OperationalInsights/workspaces/search/action",
          "Microsoft.Support/*"
          // Log Analytics Reader End
        ]
        notActions = [
          //Log Analytics Reader Start
          "Microsoft.OperationalInsights/workspaces/sharedKeys/read"
          // Log Analytics Reader End
        ],
        dataActions    = [],
        notDataActions = []
      }
      assignable_scopes = [
        data.azurerm_subscription.current.id
      ]
    }

    prod-Administrator = {
      name        = "prod-Administrator"
      description = "Custom Role that assigns SCR to Azure Portal and Log Analytics Contributor etc"
      scope       = data.azurerm_subscription.current.id

      permissions = {
        actions = [
          //Support Request Contributor start
          "Microsoft.Authorization/*/read",
          "Microsoft.Resources/subscriptions/resourceGroups/read",
          "Microsoft.Support/*",
          // Support Request Contributor End 

          //Storage Blob Data Contributor start
          "Microsoft.Storage/storageAccounts/blobServices/containers/delete",
          "Microsoft.Storage/storageAccounts/blobServices/containers/read",
          "Microsoft.Storage/storageAccounts/blobServices/containers/write",
          "Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey/action",
          //Storage Blob Data Contributor End

          // Resource Locks start
          "Microsoft.Authorization/locks/*",
          // Resource Locks end

          // Log Analytics Contributor start
          "*/read",
          "Microsoft.ClassicCompute/virtualMachines/extensions/*",
          "Microsoft.ClassicStorage/storageAccounts/listKeys/action",
          "Microsoft.Compute/virtualMachines/extensions/*",
          "Microsoft.HybridCompute/machines/extensions/write",
          "Microsoft.Insights/alertRules/*",
          "Microsoft.Insights/diagnosticSettings/*",
          "Microsoft.OperationalInsights/*",
          "Microsoft.OperationsManagement/*",
          "Microsoft.Resources/deployments/*",
          "Microsoft.Resources/subscriptions/resourcegroups/deployments/*",
          "Microsoft.Storage/storageAccounts/listKeys/action",
          "Microsoft.Support/*",
          // Log Analytics Contributor end

          // Billing Reader start 
          "Microsoft.Authorization/*/read",
          "Microsoft.Billing/*/read",
          "Microsoft.Commerce/*/read",
          "Microsoft.Consumption/*/read",
          "Microsoft.Management/managementGroups/read",
          "Microsoft.CostManagement/*/read",
          "Microsoft.Support/*"
          // Billing Reader End

        ],
        notActions = [
          "Microsoft.OperationalInsights/workspaces/sharedKeys/read"
        ],
        dataActions = [
          //Storage Blob Data Contributor start
          "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/delete",
          "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read",
          "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write",
          "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/move/action",
          "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action"
          //Storage Blob Data Contributor End
        ],
        notDataActions = []
      }
      assignable_scopes = [
        data.azurerm_subscription.current.id
      ]
    }

  }
}