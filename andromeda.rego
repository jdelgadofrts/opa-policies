package httpapi.andromeda

# HTTP API request
import input

default allow = false

allow {
  role := data.users[input.username].andromeda.role
  endpoint := input.endpoint
  client := input.client

  # Assertions
  # User has been assigned the client from the input
  client == data.users[input.username].andromeda.clients[i]
  # The role allows for the endpoint
  data.roles[role].endpoints[i] == endpoint
}

# Admins have access to everything on the client
allow {
  role := data.users[input.username].andromeda.role
  client := input.client

  role == "admin"
  client == data.users[input.username].andromeda.clients[i]
}

# Super admins have access to everything
allow {
  role := data.users[input.username].andromeda.role
  role == "super_admin"
}
