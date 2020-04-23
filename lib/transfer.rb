class Transfer
      
      attr_reader :sender, :receiver, :amount
      attr_accessor :status

    def initialize(sender, receiver, amount)
     @sender = sender
     @receiver = receiver        
     @status = "pending"        
     @amount = amount  
    end

    def valid?      
      self.sender.valid? && self.receiver.valid? 
    end

    def execute_transaction      
      if valid? && self.status == "pending" && self.sender.balance >= self.amount     
      self.receiver.balance += self.amount      
      self.sender.balance -= self.amount     
      @status = "complete"     
      else        
      @status = "rejected"      
      "Transaction rejected. Please check your account balance."      
      end    
    end
    
    def reverse_transfer      
      if valid? && self.status == "complete" && self.receiver.balance >= self.amount     
        self.sender.balance += self.amount      
        self.receiver.balance -= self.amount      
        @status = "reversed"      
      end
    end
end
