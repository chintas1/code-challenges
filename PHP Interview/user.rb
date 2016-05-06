class User
  attr_accessor :id, :first_name, :last_name, :email, :country, :ip_address

  def initialize(id: -1, first_name: '', last_name: '', email: '', country: '', ip_address: '')
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @country = country
    @ip_address = ip_address
  end

  def greet
    puts "Hello I am #{self.full_name}. I am from the #{self.country}."
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end
end

