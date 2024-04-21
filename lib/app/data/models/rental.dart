class Rental {
  int id;
  DateTime currentDate;
  int customerID;
  int equipmentID;
  DateTime rentalDate;
  DateTime returnDate;
  double cost;
  Rental(
      {required this.id,
      required this.currentDate,
      required this.customerID,
      required this.equipmentID,
      required this.rentalDate,
      required this.returnDate,
      this.cost = 0});

  List<String> toList() {
    return [
      id.toString(),
      currentDate.toString(),
      customerID.toString(),
      equipmentID.toString(),
      rentalDate.toString(),
      returnDate.toString(),
      cost.toString()
    ];
  }
}
