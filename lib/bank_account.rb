class BankAccount
    attr_reader :name
    attr_accessor  :balance, :status 
    def initialize(name, balance = 1000,status = "open")
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(money)
        self.balance += money
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def close_account
        self.status = "closed"

    end

    def valid?
        balance > 0 && status == "open"
    end
end
