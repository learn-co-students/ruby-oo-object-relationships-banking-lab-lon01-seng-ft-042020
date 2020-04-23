 require "pry"
 require_relative "./bank_account"

 class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  @@all =[]

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && valid? && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
    end
  end

end

saif = BankAccount.new("Saif")
gbenga = BankAccount.new("Gbenga")

transfer1 = Transfer.new(saif, gbenga, 50)
puts Transfer.all
#binding.pry

#1. compare each transfer with self, and if it doesn exist in @@all, then we allow the transaction
#2. see if the sender, reciever, amount are unique and then add the whole object