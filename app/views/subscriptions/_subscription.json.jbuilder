json.extract! subscription, :id, :name, :provider_id, :category_id, :billing_cycle, :monthly_cost, :currency, :next_renewal_on, :account_email, :mfa_enabled, :mfa_method, :credentials_location, :notes, :purpose, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
