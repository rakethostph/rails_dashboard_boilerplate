# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(
# 		email: 'example_1@example.com', 
# 		password: "qazx1234" ,
# 		password_confirmation: "qazx1234"
# 	).confirm

10.times do |i|
	user = User.new
	user.email = 'example_' + "#{i+1}" + '@example.com'
	user.password = 'qazx1234'
	user.password_confirmation = 'qazx1234'
	user.save! 
	user.confirm

	puts "#{i}"
end

['client', 'agent', 'distributor', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

user = User.find(1)
user.remove_role :client
user.add_role :admin

require 'faker'

Profile.where(first_name: nil ).each do |profile|
	profile.update_attribute(:first_name, Faker::Name.first_name)
	profile.update_attribute(:last_name, Faker::Name.last_name)

	puts profile.id
end

Product.create(
		[
			{
			product_name: 'Gruenheim Vacuum GHV1', 
			product_price: "60000" ,
			product_description: "Used for only three months by a cleaning services company, but is still in excellent condition! Original price at 80,000. Bought just in Feb 2019. Warranty is 5 years for the motor. Complete with papers. "
			},
			{
			product_name: 'Gruenheim GHS2 Steam Cleaning System', 
			product_price: "45000" ,
			product_description: "Used for only three months by a cleaning services company, but is still in excellent condition! Original price at 80,000. Bought just in Feb 2019. Warranty is 5 years for the motor. Complete with papers. "
			},
		]
	)

