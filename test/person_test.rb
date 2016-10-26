require 'minitest/autorun'
require 'minitest/pride'
require './lib/person'

class PersonTest < Minitest::Test

  def test_person_has_a_name
    person = Person.new("Minerva", 1000)
    assert_equal "Minerva", person.name
  end

  def test_person_has_different_name
    person = Person.new("Luna", 500)
    assert_equal "Luna", person.name
  end

  def test_person_has_a_cash_level
    person = Person.new("Minerva", 1000)
    assert_equal 1000, person.cash_level
  end

  def test_person_has_a_different_cash_level
    person = Person.new("Luna", 500)
    assert_equal 500, person.cash_level
  end

end
