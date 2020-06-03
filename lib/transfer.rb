class Transfer

  attr_accessor :name, :bank_account, :receiver, :sender, :amount, :status
  attr_reader
  attr_writer

  def initialize(sender, receiver, amount)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance > @amount && @status != "complete" && valid?

      receiver.balance += @amount
      sender.balance -= @amount
      @status = "complete"
    
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if receiver.balance > @amount && @status == "complete" && valid?
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
