resource "random_password" "service_principal_password" {
  length = 16
  special = true
  override_special = "_%@"
}

resource "azuread_application" "application_identity" {
  name                       = var.application_identity_name
  homepage                   = "http://${var.application_identity_name}"
  identifier_uris            = var.application_identity_type == "native" ? [] : ["http://uri-${var.application_identity_name}"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = true
  type                       = var.application_identity_type
}

resource "azuread_service_principal" "service_principal" {
  application_id               = azuread_application.application_identity.application_id
  app_role_assignment_required = false
}

resource "azuread_service_principal_password" "service_principal_password" {
  service_principal_id = azuread_service_principal.service_principal.id
  value                = random_password.service_principal_password.result
  end_date             = var.service_principal_end_date
}
