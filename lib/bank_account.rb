class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(num)
    self.balance += num
  end

  def display_balance
    balance = self.balance
    "Your balance is $#{balance}."
  end

  def valid?
    if self.balance > 0 && @status == "open"
      return true
    else
      return false
    end
  end

  def close_account
    self.status = "closed"

  end
end
