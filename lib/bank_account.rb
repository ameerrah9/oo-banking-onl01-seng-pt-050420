class BankAccount

    attr_accessor :balance, :status, :deposit, :transfer
    attr_reader :name
    attr_writer

    @@account = 0

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(money)
        self.balance += money
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        self.status == "open" && self.balance > 0
    end

    def close_account
        self.status = "closed"
    end
end
