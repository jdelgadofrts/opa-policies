package httpapi.hera

# HTTP API request
import input

default allow = false

# This is far more ABAC each endpoint has a tag attribute of CRUD
allow {
  permissions := data.users[input.username].hera.permissions
  endpoint_permission := data.actions[input.endpoint].permission

  print("******* Found permissions", permissions)

  # Assertions
  endpoint_permission == permissions[i]
}

# Super admins have access to everything
allow {
  role := data.users[input.username].role
  role == "super_admin"
}
