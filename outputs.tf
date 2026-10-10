output "cognito_risk_configurations_id" {
  description = "Map of id values across all cognito_risk_configurations, keyed the same as var.cognito_risk_configurations"
  value       = { for k, v in aws_cognito_risk_configuration.cognito_risk_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cognito_risk_configurations_account_takeover_risk_configuration" {
  description = "Map of account_takeover_risk_configuration values across all cognito_risk_configurations, keyed the same as var.cognito_risk_configurations"
  value       = { for k, v in aws_cognito_risk_configuration.cognito_risk_configurations : k => one(v.account_takeover_risk_configuration) if v.account_takeover_risk_configuration != null && length(v.account_takeover_risk_configuration) > 0 }
}
output "cognito_risk_configurations_client_id" {
  description = "Map of client_id values across all cognito_risk_configurations, keyed the same as var.cognito_risk_configurations"
  value       = { for k, v in aws_cognito_risk_configuration.cognito_risk_configurations : k => v.client_id if v.client_id != null && length(v.client_id) > 0 }
}
output "cognito_risk_configurations_compromised_credentials_risk_configuration" {
  description = "Map of compromised_credentials_risk_configuration values across all cognito_risk_configurations, keyed the same as var.cognito_risk_configurations"
  value       = { for k, v in aws_cognito_risk_configuration.cognito_risk_configurations : k => one(v.compromised_credentials_risk_configuration) if v.compromised_credentials_risk_configuration != null && length(v.compromised_credentials_risk_configuration) > 0 }
}
output "cognito_risk_configurations_region" {
  description = "Map of region values across all cognito_risk_configurations, keyed the same as var.cognito_risk_configurations"
  value       = { for k, v in aws_cognito_risk_configuration.cognito_risk_configurations : k => v.region if v.region != null && length(v.region) > 0 }
}
output "cognito_risk_configurations_risk_exception_configuration" {
  description = "Map of risk_exception_configuration values across all cognito_risk_configurations, keyed the same as var.cognito_risk_configurations"
  value       = { for k, v in aws_cognito_risk_configuration.cognito_risk_configurations : k => one(v.risk_exception_configuration) if v.risk_exception_configuration != null && length(v.risk_exception_configuration) > 0 }
}
output "cognito_risk_configurations_user_pool_id" {
  description = "Map of user_pool_id values across all cognito_risk_configurations, keyed the same as var.cognito_risk_configurations"
  value       = { for k, v in aws_cognito_risk_configuration.cognito_risk_configurations : k => v.user_pool_id if v.user_pool_id != null && length(v.user_pool_id) > 0 }
}

