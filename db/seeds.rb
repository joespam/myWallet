# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(fname:"Ron",lname:"Jaworski",phone:"6105551212",email:"ronjaw@hotmail.com",password:"12345678")
User.create(fname:"Randall",lname:"Cunningham",phone:"7171112222",email:"rcunn@hotmail.com",password:"12345678")
User.create(fname:"Michael",lname:"Vick",phone:"3022223333",email:"mvick@live.com",password:"12345678")
User.create(fname:"Donovan",lname:"Mcnabb",phone:"8063334444",email:"dmcnabb@geocities.com",password:"12345678")

Card.create(user_id: 1, number: 378282246310005, expire_month: 3, expire_year: 2020, balance: 1000000)
Card.create(user_id: 1, number: 4012888888881881, expire_month: 12, expire_year: 2017, balance: 20)
Card.create(user_id: 1, number: 3566002020360505, expire_month: 6, expire_year: 2024, balance: 4000)

Card.create(user_id: 2, number: 371449635398431, expire_month: 9, expire_year: 2016, balance: 90000)
Card.create(user_id: 2, number: 38520000023237, expire_month: 2, expire_year: 2018, balance: 20000)
Card.create(user_id: 2, number: 6011111111111117, expire_month: 7, expire_year: 2023, balance: 900)

Card.create(user_id: 3, number: 6011000990139424, expire_month: 8, expire_year: 2022, balance: 500000)
Card.create(user_id: 3, number: 3530111333300000, expire_month: 11, expire_year: 2015, balance: 70000)
Card.create(user_id: 3, number: 5105105105105100, expire_month: 1, expire_year: 2021, balance: 9000)

Card.create(user_id: 4, number: 5555555555554444, expire_month: 4, expire_year: 2016, balance: 90000)
Card.create(user_id: 4, number: 4111111111111111, expire_month: 5, expire_year: 2018, balance: 20000)
Card.create(user_id: 4, number: 4222222222222, expire_month: 6, expire_year: 2023, balance: 900)
