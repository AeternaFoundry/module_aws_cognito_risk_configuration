variable "cognito_risk_configurations" {
  description = <<EOT
Map of cognito_risk_configurations, attributes below
Required:
    - user_pool_id
Optional:
    - client_id
    - region
    - account_takeover_risk_configuration (block):
        - actions (required, block):
            - high_action (optional, block):
                - event_action (required)
                - notify (required)
            - low_action (optional, block):
                - event_action (required)
                - notify (required)
            - medium_action (optional, block):
                - event_action (required)
                - notify (required)
        - notify_configuration (optional, block):
            - block_email (optional, block):
                - html_body (required)
                - subject (required)
                - text_body (required)
            - from (optional)
            - mfa_email (optional, block):
                - html_body (required)
                - subject (required)
                - text_body (required)
            - no_action_email (optional, block):
                - html_body (required)
                - subject (required)
                - text_body (required)
            - reply_to (optional)
            - source_arn (required)
    - compromised_credentials_risk_configuration (block):
        - actions (required, block):
            - event_action (required)
        - event_filter (optional)
    - risk_exception_configuration (block):
        - blocked_ip_range_list (optional)
        - skipped_ip_range_list (optional)
EOT

  type = map(object({
    user_pool_id = string
    client_id    = optional(string)
    region       = optional(string)
    account_takeover_risk_configuration = optional(object({
      actions = object({
        high_action = optional(object({
          event_action = string
          notify       = bool
        }))
        low_action = optional(object({
          event_action = string
          notify       = bool
        }))
        medium_action = optional(object({
          event_action = string
          notify       = bool
        }))
      })
      notify_configuration = optional(object({
        block_email = optional(object({
          html_body = string
          subject   = string
          text_body = string
        }))
        from = optional(string)
        mfa_email = optional(object({
          html_body = string
          subject   = string
          text_body = string
        }))
        no_action_email = optional(object({
          html_body = string
          subject   = string
          text_body = string
        }))
        reply_to   = optional(string)
        source_arn = string
      }))
    }))
    compromised_credentials_risk_configuration = optional(object({
      actions = object({
        event_action = string
      })
      event_filter = optional(set(string))
    }))
    risk_exception_configuration = optional(object({
      blocked_ip_range_list = optional(set(string))
      skipped_ip_range_list = optional(set(string))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cognito_risk_configurations : (
        v.account_takeover_risk_configuration == null || (v.account_takeover_risk_configuration.notify_configuration == null || (v.account_takeover_risk_configuration.notify_configuration.block_email == null || (length(v.account_takeover_risk_configuration.notify_configuration.block_email.html_body) >= 6 && length(v.account_takeover_risk_configuration.notify_configuration.block_email.html_body) <= 20000)))
      )
    ])
    error_message = "must be between 6 and 20000 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cognito_risk_configurations : (
        v.account_takeover_risk_configuration == null || (v.account_takeover_risk_configuration.notify_configuration == null || (v.account_takeover_risk_configuration.notify_configuration.block_email == null || (length(v.account_takeover_risk_configuration.notify_configuration.block_email.subject) >= 1 && length(v.account_takeover_risk_configuration.notify_configuration.block_email.subject) <= 140)))
      )
    ])
    error_message = "must be between 1 and 140 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cognito_risk_configurations : (
        v.account_takeover_risk_configuration == null || (v.account_takeover_risk_configuration.notify_configuration == null || (v.account_takeover_risk_configuration.notify_configuration.block_email == null || (length(v.account_takeover_risk_configuration.notify_configuration.block_email.text_body) >= 6 && length(v.account_takeover_risk_configuration.notify_configuration.block_email.text_body) <= 20000)))
      )
    ])
    error_message = "must be between 6 and 20000 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cognito_risk_configurations : (
        v.account_takeover_risk_configuration == null || (v.account_takeover_risk_configuration.notify_configuration == null || (v.account_takeover_risk_configuration.notify_configuration.mfa_email == null || (length(v.account_takeover_risk_configuration.notify_configuration.mfa_email.html_body) >= 6 && length(v.account_takeover_risk_configuration.notify_configuration.mfa_email.html_body) <= 20000)))
      )
    ])
    error_message = "must be between 6 and 20000 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cognito_risk_configurations : (
        v.account_takeover_risk_configuration == null || (v.account_takeover_risk_configuration.notify_configuration == null || (v.account_takeover_risk_configuration.notify_configuration.mfa_email == null || (length(v.account_takeover_risk_configuration.notify_configuration.mfa_email.subject) >= 1 && length(v.account_takeover_risk_configuration.notify_configuration.mfa_email.subject) <= 140)))
      )
    ])
    error_message = "must be between 1 and 140 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cognito_risk_configurations : (
        v.account_takeover_risk_configuration == null || (v.account_takeover_risk_configuration.notify_configuration == null || (v.account_takeover_risk_configuration.notify_configuration.mfa_email == null || (length(v.account_takeover_risk_configuration.notify_configuration.mfa_email.text_body) >= 6 && length(v.account_takeover_risk_configuration.notify_configuration.mfa_email.text_body) <= 20000)))
      )
    ])
    error_message = "must be between 6 and 20000 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cognito_risk_configurations : (
        v.account_takeover_risk_configuration == null || (v.account_takeover_risk_configuration.notify_configuration == null || (v.account_takeover_risk_configuration.notify_configuration.no_action_email == null || (length(v.account_takeover_risk_configuration.notify_configuration.no_action_email.html_body) >= 6 && length(v.account_takeover_risk_configuration.notify_configuration.no_action_email.html_body) <= 20000)))
      )
    ])
    error_message = "must be between 6 and 20000 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cognito_risk_configurations : (
        v.account_takeover_risk_configuration == null || (v.account_takeover_risk_configuration.notify_configuration == null || (v.account_takeover_risk_configuration.notify_configuration.no_action_email == null || (length(v.account_takeover_risk_configuration.notify_configuration.no_action_email.subject) >= 1 && length(v.account_takeover_risk_configuration.notify_configuration.no_action_email.subject) <= 140)))
      )
    ])
    error_message = "must be between 1 and 140 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cognito_risk_configurations : (
        v.account_takeover_risk_configuration == null || (v.account_takeover_risk_configuration.notify_configuration == null || (v.account_takeover_risk_configuration.notify_configuration.no_action_email == null || (length(v.account_takeover_risk_configuration.notify_configuration.no_action_email.text_body) >= 6 && length(v.account_takeover_risk_configuration.notify_configuration.no_action_email.text_body) <= 20000)))
      )
    ])
    error_message = "must be between 6 and 20000 characters"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

