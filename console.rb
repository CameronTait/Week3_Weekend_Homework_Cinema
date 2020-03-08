require('pry-byebug')

require_relative('models/film')
require_relative('models/ticket')
require_relative('models/customer')

Customer.delete_all
Film.delete_all

customer1  = Customer.new({'name' => 'Michael Jackson', 'funds' => 200})
customer2  = Customer.new({'name' => 'Lil Pump', 'funds' => 60})
customer3  = Customer.new({'name' => 'Justin Bieber', 'funds' => 15})
customer1.save
customer2.save
customer3.save

customer3.name = "Corey Taylor"
customer3.update

film1 = Film.new({'title' => 'Joker', 'price' => 4})
film1.save
film2 = Film.new({'title' => 'IT', 'price' => 3})
film2.save
film3 = Film.new({'title' => 'Avengers', 'price' => 5})
film3.save

film3.title = "Batman"
film3.update


binding.pry
nil
