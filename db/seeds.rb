# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Customer.create!([
  { full_name: "Maxine Carter", phone_number: "204-555-1000", email: "maxine@example.com", notes: "VIP customer" },
  { full_name: "Dave Kim", phone_number: "204-555-1001", email: "", notes: "Prefers SMS" },
  { full_name: "Kurt Lee", phone_number: "204-555-1002", email: nil, notes: "Met at trade show" },
  { full_name: "Brent F.", phone_number: "204-555-1003", email: "brent@example.com", notes: "Important account" },
  { full_name: "Sarah P.", phone_number: "204-555-1004", email: "sarah@example.com", notes: "Long-term client" }
])
