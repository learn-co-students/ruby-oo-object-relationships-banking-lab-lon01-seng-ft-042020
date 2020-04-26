class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def valid?
    sender.valid? && receiver.valid? 
  end
  def execute_transaction
    if sender.balance > @amount && @status == "pending" && valid?
    sender.balance -= self.amount
    receiver.balance += self.amount
    self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    #binding.pry
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
end



