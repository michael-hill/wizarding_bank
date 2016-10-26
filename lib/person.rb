class Person
  attr_reader :name,
              :cash_level,
              :bank_account

  def initialize(name, cash_level)
    @name = name
    @cash_level = cash_level
    @bank_account = []
  end

end


person_1 = Person.new("Minerva", 1000)
person_2 = Person.new("luna", 500)
