# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
hetzner = Provider.create!(name: "Hetzner", website: "https://hetzner.com")
do_provider = Provider.create!(name: "DigitalOcean", website: "https://digitalocean.com")
namecheap = Provider.create!(name: "Namecheap", website: "https://namecheap.com")
proton = Provider.create!(name: "Proton", website: "https://proton.me")

compute = Category.create!(name: "Compute", color: "blue")
domain = Category.create!(name: "Domain", color: "purple")
email = Category.create!(name: "Email", color: "green")

Subscription.create!([
  {
    name: "VPS-01 (Hetzner CPX11)",
    provider: hetzner,
    category: compute,
    billing_cycle: 0, # monthly
    monthly_cost: 5.35,
    currency: 0, # eur
    next_renewal_on: 30.days.from_now,
    account_email: "admin@example.com",
    mfa_enabled: true,
    mfa_method: "TOTP",
    purpose: "Main app server",
    notes: "Nuremberg region"
  },
  {
    name: "example.com domain",
    provider: namecheap,
    category: domain,
    billing_cycle: 1, # yearly
    monthly_cost: 12.00,
    currency: 1, # usd
    next_renewal_on: 6.months.from_now,
    account_email: "admin@example.com",
    mfa_enabled: true,
    purpose: "Primary domain"
  },
  {
    name: "Proton Mail Plus",
    provider: proton,
    category: email,
    billing_cycle: 1,
    monthly_cost: 4.00,
    currency: 1,
    next_renewal_on: 15.days.from_now,
    account_email: "admin@example.com",
    mfa_enabled: true,
    purpose: "Business email"
  }
])