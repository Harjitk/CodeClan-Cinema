require_relative('models/films')
require_relative('models/customers')
require_relative('models/tickets')

require('pry')


Film.delete_all()
Customer.delete_all()
Ticket.delete_all()

film1 = Film.new({'title' => 'Hunger Games', 'price' => '5', })
film2 = Film.new({'title' => 'Home Alone', 'price' => '5'})
film3 = Film.new({'title' => 'American Gangster', 'price' => '5'})

film1.save()
film1.title = "Avatar"
film1.update()
film2.save()
film3.save()

customer1 = Customer.new({'name' => 'Harjit', 'funds' => '20'})
customer2 = Customer.new({'name' => 'Harry', 'funds' => '15'})
customer3 = Customer.new({'name' => 'Lynsey', 'funds' => '30'})

customer1.save()
customer1.name = "Christine"
customer1.update()

customer2.save()
customer3.save()

# customer1.delete()


ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id})

ticket1.save()
ticket2.save()
ticket3.save()

binding.pry
nil
