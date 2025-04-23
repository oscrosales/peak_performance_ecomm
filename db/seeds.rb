User.destroy_all
Province.destroy_all

Provinces = [
  { name: "Alberta", abbreviation: "AB", pst: 0.05, gst: 0.05, hst: false },
  { name: "British Columbia", abbreviation: "BC", pst: 0.07, gst: 0.05, hst: false },
  { name: "Manitoba", abbreviation: "MB", pst: 0.07, gst: 0.05, hst: false },
  { name: "New Brunswick", abbreviation: "NB", pst: 0.10, gst: 0.05, hst: true },
  { name: "Newfoundland and Labrador", abbreviation: "NL", gst: 0.05, pst: 0.10, hst: true },
  { name: "Nova Scotia", abbreviation: "NS", pst: 0.10, gst: 0.05, hst: true },
  { name: "Ontario", abbreviation: "ON", pst: 0.13, gst: 0.05, hst: true },
  { name: "Prince Edward Island", abbreviation: "PE", pst: 0.10, gst: 0.05, hst: true },
  { name: "Quebec", abbreviation: "QC", pst: 0.09975, gst: 0.05, hst: false },
  { name: "Saskatchewan", abbreviation: "SK", pst: 0.06, gst: 0.05, hst: false },
  { name: "Northwest Territories", abbreviation: "NT", pst: 0.05, gst: 0.05, hst: false },
  { name: "Nunavut", abbreviation: "NU", pst: 0.05, gst: 0.05, hst: false },
  { name: "Yukon", abbreviation: "YT", pst: 0.05, gst: 0.05, hst: false }
]

Provinces.each do |province|
  Province.create!(province)
end

# AdminUser.create!(
#     email: 'admin@example.com',
#     password: 'password',
#     password_confirmation: 'password'
# ) if Rails.env.development?
