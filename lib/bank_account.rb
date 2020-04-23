# pair coded with Zakary Bad-Iru & Jamie Symonds-Tayler

require 'pry'

class BankAccount
    
    def initialize(name, balance = 1000, status = "open")
        @name = name
        @balance = balance
        @status = status
    end

    attr_reader :name, :balance, :status
    attr_writer :balance, :status

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
       @status == "open" && @balance > 0            
    end

    def close_account
        @status = "closed"
    end


end

acc_1 = BankAccount.new('dan')

