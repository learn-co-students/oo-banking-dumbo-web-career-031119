class Transfer

  attr_accessor :amount, :status, :sender, :receiver
  # attr_reader

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if sender.balance < amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      puts "Transaction has been completed"
    else
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end
