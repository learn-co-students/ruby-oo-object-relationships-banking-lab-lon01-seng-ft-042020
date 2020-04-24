class BankAccount
  #Because there is no writer for name, it cant be changed
    attr_reader :name
  #In valid? you need to be able to write to balance & status
    attr_accessor :balance, :status

  #Can initialize a Bank Account
  #Initializes with a name, that cant be changed
  #Always initializes with balance of 1000
  #Always initializes with a status of 'open'
  # NOTE: You can set default values in initialize 
    def initialize(name)     
      @name = name       
      @balance = 1000        
      @status = "open"    
    end

  #Can use @balance, balance & self.balance interchangeably
    def deposit(amount)      
    self.balance += amount  
    end
     
  #Can use @balance, balance & self.balance interchangeably                          
    def display_balance        
     "Your balance is $#{@balance}."   
    end

    #Can use @balance, balance & self.balance interchangeably
    #Similarly with @status, status & self.status
    #Use ternary operator for readability (non-programmers)
    def valid?    
    self.status == "open" && self.balance > 0  
    end  
    
    def close_account        
        self.status = "closed"   
    end

end
