class Transfer
   attr_accessor :sender, :receiver, :status, :amount
  
   def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
   end
  
   def valid?
    sender.valid? && receiver.valid?
   end 
 
   def execute_transaction
      if valid? && sender.balance > amount && self.status == "pending"
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
    end
   end
 
   def reverse_transfer
     if self.status == "complete"
       self.status = "reversed"
       sender.balance += amount
       receiver.balance -= amount
       
     end
   end
end