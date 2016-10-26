require 'minitest/autorun'
require 'minitest/pride'
require './lib/bank'
require './lib/person'

class BankTest < Minitest::Test

  def test_it_create_a_bank
    bank_1 = Bank.new("JP Morgan Chase")
    assert_equal "JP Morgan Chase", bank_1.bank_name
  end

  def test_it_can_open_an_account
    bank = Bank.new("JP Morgan Chase")
    person = Person.new("Minerva", 1000)
    assert_equal "An account has been opened for Minerva with JP Morgan Chase", bank.open_account(person)
  end

  def test_it_takes_deposit
    bank = Bank.new("JP Morgan Chase")
    person = Person.new("Minerva", 1000)
    bank.open_account(person)
    assert_equal "750 galleons have been deposited into Minerva's JP Morgan Chase account. Balance: 750 Cash: 250", bank.deposit(person, 750)
  end
  #
  def test_person_cannot_deposit_more_money_than_their_cash_level
    bank = Bank.new("JP Morgan Chase")
    person = Person.new("Luna", 1000)
    bank.open_account(person)
    assert_equal "Luna does not have enought cash to perform this deposit.", bank.deposit(person, 1200)
  end

  def test_person_can_make_withdrawals
    bank = Bank.new("JP Morgan Chase")
    person = Person.new("Minerva", 1000)
    bank.open_account(person)
    bank.deposit(person, 500)
    assert_equal "Minerva has withdrawn 250 galleons. Balance: 250", bank.withdrawal(person, 250)
  end

  def test_insufficient_funds
    bank = Bank.new("JP Morgan Chase")
    person = Person.new("Minerva", 1000)
    assert_equal "Insufficient funds", bank.withdrawal(person, 1200)
  end

  def test_person_can_transfer_money
    bank = Bank.new("JP Morgan Chase")
    bank_1 = Bank.new("Wells Fargo")
    person = Person.new("Minerva",1000)
    bank.open_account(person)
    bank.deposit(person, 1000)
    bank.transfer(person, bank_1, 200)
    assert_equal "Minerva has transferred 200 galleons from JP Morgan Chase to Wells Fargo.", bank.transfer(person, "Wells Fargo", 200)
  end

end
