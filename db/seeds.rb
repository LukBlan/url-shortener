# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#User.destroy_all
#user1 = User.new(email: "test@gmail.com")
#user1.save!

#ShortenedUrl.destroy_all
#short_url1 = ShortenedUrl.create_short_url(user1, "example/test.com")
#short_url2 = ShortenedUrl.create_short_url(user1, "example/test2.com")

user = User.find(8)
ShortenedUrl.create_short_url!(user, "test2.com.ar")
