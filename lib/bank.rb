require './lib/person'
require 'pry'
class Bank
  attr_reader :bank_name,
              :name,
              :balance,
              :cash

  def initialize(bank_name)
    @bank_name = bank_name
    @balance = 0
  end

  def open_account(person)
    @name = person.name
    person.bank_account << bank_name
   "An account has been opened for #{name} with #{bank_name}"
  end

  def deposit(person, deposit_amount)
    if person.cash_level < deposit_amount
      "#{name} does not have enought cash to perform this deposit."
    else
      @balance += deposit_amount
      @cash = person.cash_level - deposit_amount
     "#{deposit_amount} galleons have been deposited into #{name}'s #{bank_name} account. Balance: #{balance} Cash: #{cash}"
    end
  end

  def withdrawal(person, amount)
    if amount > @balance
     "Insufficient funds"
    else
      @balance -= amount
     "#{name} has withdrawn #{amount} galleons. Balance: #{balance}"
    end
  end

  def transfer(person, transfer_bank_name, transfer_amount)
    if transfer_amount > @balance
       "Insufficient Funds"
    else
       "#{name} has transferred #{transfer_amount} galleons from #{bank_name} to #{transfer_bank_name}."
    end
  end

end

# person_1 = Person.new("Minerva", 1000)
# bank = Bank.new("JP Morgan Chase")
# puts bank.deposit(person_1, 750)
# puts bank.open_account(person_1)
# bank.withdrawal(person_1, 100)
# bank.transfer(person_1, "Wells Fargo", 200)
