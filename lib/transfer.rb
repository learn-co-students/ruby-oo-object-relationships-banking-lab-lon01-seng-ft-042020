class Transfer
 
attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount 
        @status = "pending"
    end 

    def sender_sufficent_funds?
        sender.balance >= @amount
      end
    
      def completed?
        @status == "complete"
      end
    
      def both_accounts_valid?
        sender.valid? && receiver.valid?
      end
    
      def valid?
        both_accounts_valid? && !completed? && sender_sufficent_funds?
      end
    
      def execute_transaction
        if self.valid?
          sender.withdraw(@amount)
          receiver.deposit(@amount)
          @status = "complete"
          return @status
        else
          @status = "rejected"
          return "Transaction rejected. Please check your account balance."
        end
      end
    
      def reverse_transfer
        if @status == "complete"
          transfer = Transfer.new(@receiver, @sender, @amount)
          transfer.execute_transaction
          @status = "reversed"
        end
      end

end

    # previous way wothout taking account the sufficent funds
    # def valid?
    #     @sender.valid? && @receiver.valid?
    # end

    # def execute_transaction
    #     if valid? && @status == "pending" && 
    #         @sender.balance > @amount 
    #         @receiver.balance = @receiver.balance + @amount
    #         @sender.balance = @sender.balance - @amount
    #         @status = "complete" 
    #     else
    #         @status = "rejected"
    #         "Transaction rejected. Please check your account balance."
    #     end 
    # end

    # def reverse_transfer
    #     if @status == "complete" 
    #         @receiver.balance = @receiver.balance - @amount
    #         @sender.balance = @sender.balance + @amount
    #         @status = "reversed"
    #     end
    # end
