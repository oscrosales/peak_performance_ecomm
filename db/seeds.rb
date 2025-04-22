Province.destroy_all

Provinces = [
  { name: "Alberta", abbreviation: "AB", pst: 0.05 },
  { name: "British Columbia", abbreviation: "BC", pst: 0.07 },
  { name: "Manitoba", abbreviation: "MB", pst: 0.07 },
  { name: "New Brunswick", abbreviation: "NB", pst: 0.10 },
  { name: "Newfoundland and Labrador", abbreviation: "NL", pst: 0.10 },
  { name: "Nova Scotia", abbreviation: "NS", pst: 0.10 },
  { name: "Ontario", abbreviation: "ON", pst: 0.13 },
  { name: "Prince Edward Island", abbreviation: "PE", pst: 0.10 },
  { name: "Quebec", abbreviation: "QC", pst: 0.09975 },
  { name: "Saskatchewan", abbreviation: "SK", pst: 0.06 },
  { name: "Northwest Territories", abbreviation: "NT", pst: 0.05 },
  { name: "Nunavut", abbreviation: "NU", pst: 0.05 },
  { name: "Yukon", abbreviation: "YT", pst: 0.05 }
]

Provinces.each do |province|
  Province.create!(province)
end

# AdminUser.create!(
#     email: 'admin@example.com',
#     password: 'password',
#     password_confirmation: 'password'
# ) if Rails.env.development?
