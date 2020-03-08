require('pg')
require_relative("../db/sql_runner")
require_relative("./film")
require_relative("./customer")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize (options)
    @id = options['id'] if options['id'].to_i
    @customer_id = options['customer_id']
    @film_id = options['film_id']

  end

  def save()
    sql = "INSERT INTO tickets
        (customer_id, film_id)
      VALUES
        ($1, $2)
    RETURNING id"
    values = [@customer_id, @film_id]
    visit = SqlRunner.run(sql, values).first
    @id = visit['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end


  def self.all()
    sql = "SELECT * FROM tickets"
    ticket = SqlRunner.run(sql)
    result = ticket.map {|ticket| Ticket.new(ticket)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end