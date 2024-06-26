require 'net/http'
require 'json'

def fetch_data(api_url)
  uri = URI(api_url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
rescue JSON::ParserError => e
  puts "Failed to parse JSON from #{api_url}: #{e.message}"
  []
end

def seed_parks(api_url)
  parks_data = fetch_data(api_url)
  parks_data.each do |park|
    location = Location.find_or_create_by!(description: park['location_description'])
    neighbourhood = Neighbourhood.find_or_create_by!(name: park['neighbourhood'])
    district = District.find_or_create_by!(name: park['district'])

    Park.create!(
      name: park['park_name'],
      location: location,
      neighbourhood: neighbourhood,
      district: district,
      cca: park['cca']
    )
  end
end

# API URL
parks_api_url = 'https://data.winnipeg.ca/resource/tx3d-pfxq.json'

# Seed data
seed_parks(parks_api_url)

# Ensure AdminUser is created only if it doesn't already exist
if Rails.env.development? && AdminUser.find_by(email: 'admin@example.com').nil?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
