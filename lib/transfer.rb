class Transfer

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  attr_accessor :sender, :receiver, :amount, :status
    def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end
  def execute_transaction
    if @status == "pending" && self.valid?
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    else @sender.balance < @amount
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
