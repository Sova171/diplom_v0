# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
#User.new({ :name => 'Admin', :email => 'admin@example.com', :password => 'AdminPassword', :password_confirmation => 'AdminPassword', :admin => true }).save!
require_relative 'seeds/users'
require_relative 'seeds/achievements'