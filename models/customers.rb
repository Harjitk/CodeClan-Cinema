require_relative("../db/SqlRunner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE * FROM customers where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
     sql = "DELETE FROM customers"
     SqlRunner.run(sql)
   end

   def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id
    WHERE customer_id = $1"
    values = [@id]
    movie_data = SqlRunner.run(sql, values)
    #return Film.map_items(film_data)
    return film_data.map{|film| Film.new(film)}
  end

# basic extensions

  def buy_ticket(film)
	    @funds -= film.price.to_i
	  end

  def tickets_bought_by_customer()
   sql = "SELECT * FROM tickets WHERE customer_id = $1"
   values = [@id]
   results = SqlRunner.run(sql, values)
   return results.count()
 end

end
