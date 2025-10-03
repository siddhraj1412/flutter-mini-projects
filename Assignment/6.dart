class BankAccount {
  double _balance = 0.0;
  String? accountHolder;

  BankAccount({this.accountHolder});

  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited: ₹${amount}, New Balance: ₹$_balance');
    } else {
      print('Deposit amount must be positive');
    }
  }

  void withdraw(double amount) {
    if (amount <= _balance && amount > 0) {
      _balance -= amount;
      print('Withdrew: ₹${amount}, New Balance: ₹$_balance');
    } else {
      print('Insufficient balance or invalid amount');
    }
  }
}

void main() {
  var account = BankAccount(accountHolder: 'Om');
  account.deposit(150000.0);
  account.withdraw(105000.0);
}
