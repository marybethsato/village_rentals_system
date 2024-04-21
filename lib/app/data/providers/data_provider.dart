import 'package:get/get.dart';
import 'package:village_rentals_system/app/data/models/category.dart';
import 'package:village_rentals_system/app/data/models/customer.dart';
import 'package:village_rentals_system/app/data/models/equipment.dart';
import 'package:village_rentals_system/app/data/models/rental.dart';

RxList<Category> categories = RxList([
  Category(id: 10, name: 'Power Tools'),
  Category(id: 20, name: 'Yard Equipment'),
  Category(id: 30, name: 'Compressors'),
  Category(id: 40, name: 'Generators'),
  Category(id: 50, name: 'Air Tools')
]);

RxList<Equipment> equipmentList = RxList([
  Equipment(id: 101, name: 'Hammer Drill', description: 'Powerful drill for concrete and masonry', dailyRentalCost: 25.99, category: 10),
  Equipment(id: 201, name: 'Chainsaw', description: 'Gas-powered chainsaw for cutting wood', dailyRentalCost: 49.99, category: 20),
  Equipment(id: 202, name: 'Lawn mower', description: 'Self-propelled lawn mower with mulching function', dailyRentalCost: 19.99, category: 20),
  Equipment(id: 301, name: 'Small Compressor', description: '5 Gallon Compressor-Portable', dailyRentalCost: 14.99, category: 30),
  Equipment(id: 501, name: 'Brad Nailer', description: 'Brad Nailer. Requires 3/4 to 1 1/2 Brad Nails', dailyRentalCost: 10.99, category: 50)
]);

RxList<Customer> customers = RxList([
  Customer(id: 1001, lastName: 'Doe', firstName: 'John', phone: '(555) 555 1212', email: 'jd@sample.net'),
  Customer(id: 1002, lastName: 'Smith', firstName: 'Jane', phone: '(555) 555-3434', email: 'js@live.com'),
  Customer(id: 1003, lastName: 'Lee', firstName: 'Michael', phone: '(555) 555-5656', email: 'ml@sample.net')
]);

RxList<Rental> rentals = RxList([
  Rental(id: 1000, currentDate: DateTime(2024, 02, 15), customerID: 1001, equipmentID: 201, rentalDate: DateTime(2024, 02, 20), returnDate: DateTime(2024, 02, 23), cost: 149.97),
  Rental(id: 1001, currentDate: DateTime(2024, 02, 16), customerID: 1002, equipmentID: 501, rentalDate: DateTime(2024, 02, 21), returnDate: DateTime(2024, 02, 25), cost: 43.96)
]);

  List<String> customerHeaders = ['id', 'last_name', 'first_name', 'phone', 'email', 'is_banned', 'discount'];
  List<String> equipmentHeaders = ['id', 'category_id', 'name', 'description', 'daily_rental_cost'];
  List<String> rentalHeaders = ['id', 'current_date', 'customer_id', 'equipment_id', 'rental_date', 'return_date', 'cost'];