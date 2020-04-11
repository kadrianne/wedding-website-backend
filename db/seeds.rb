# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Guest.destroy_all
Address.destroy_all
Household.destroy_all

sample_family = Household.create(family: 'Sample', region: 'Colorado')
CO_address = Address.create(street1: '123 Main St', city: 'Denver', state: 'CO', zip: '80216', country: 'USA', household: sample_family)
guest1 = Guest.create(first_name: 'Sally', last_name: 'Samply', age: 'Adult', email: 'ssample@email.com', phone: '555-555-5555', household: sample_family)