# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Resident.destroy_all
Shelter.destroy_all

arlington_life = Shelter.create!(shelter_name: 'Arlington Life Shelter', address: '325 W DIVISION ST. ARLINGTON, TX 76011', case_management_available: true, capasity: 50)
austin_street = Shelter.create!(shelter_name: 'Austin Street Shelter', address: '2929 HICKORY ST, DALLAS, TX 75226', case_management_available: false, capasity: 25)

arlington_life.residents.create!(family_name: 'Bradley', long_term_housing_need: false, family_size: 2)
arlington_life.residents.create!(family_name: 'Johansen', long_term_housing_need: true, family_size: 3)
arlington_life.residents.create!(family_name: 'Marz', long_term_housing_need: false, family_size: 2)
arlington_life.residents.create!(family_name: 'Perez', long_term_housing_need: true, family_size: 8)
arlington_life.residents.create!(family_name: 'Farnsworth', long_term_housing_need: false, family_size: 5)
arlington_life.residents.create!(family_name: 'Cowen', long_term_housing_need: true, family_size: 2)

austin_street.residents.create!(family_name: 'Jones', long_term_housing_need: true, family_size: 2)
austin_street.residents.create!(family_name: 'Dortz', long_term_housing_need: true, family_size: 1)
austin_street.residents.create!(family_name: 'Pens', long_term_housing_need: true, family_size: 3)