class Employee {
  String name;
  double hourlyRate;
  double hoursWorked;

  Employee(this.name, this.hourlyRate, this.hoursWorked);

  double calculateSalary() {
    if (hoursWorked > 40) {
      double overtime = hoursWorked - 40;
      double overtimePay = overtime * hourlyRate * 1.5;
      return 40 * hourlyRate + overtimePay;
    } else {
      return hoursWorked * hourlyRate;
    }
  }
}

void main() {
  List<Employee> employees = [
    Employee('Om', 300.0, 45),
    Employee('Hari', 250.0, 38),
    Employee('Choksi', 400.0, 50),
  ];

  for (var employee in employees) {
    print('${employee.name} earned: ₹${employee.calculateSalary()} this week.');
  }
}
