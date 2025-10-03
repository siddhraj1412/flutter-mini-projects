import 'dart:io';

void main() {
  Map<String, double> products = {
    'Laptop': 78000.0,
    'Smartphone': 34000.0,
    'Headphones': 4500.0,
  };

  double totalAmount = 0.0;

  try {
    print('Enter the quantity for Laptop:');
    int laptopQty = int.parse(stdin.readLineSync()!);
    print('Enter the quantity for Smartphone:');
    int smartphoneQty = int.parse(stdin.readLineSync()!);
    print('Enter the quantity for Headphones:');
    int headphonesQty = int.parse(stdin.readLineSync()!);

    if (laptopQty < 0 || smartphoneQty < 0 || headphonesQty < 0) {
      throw FormatException('You cannot enter negative quantities!');
    }

    totalAmount += products['Laptop']! * laptopQty;
    totalAmount += products['Smartphone']! * smartphoneQty;
    totalAmount += products['Headphones']! * headphonesQty;

    print('Total cost: ₹${totalAmount}');
  } catch (e) {
    print('Error: $e');
  }
}
