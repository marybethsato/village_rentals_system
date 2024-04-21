class Equipment {
  int id;
  String name;
  String description;
  double dailyRentalCost;
  int category;

  Equipment({required this.id, required this.name, required this.description, required this.dailyRentalCost, required this.category});

  List<String> toList() {
    return [id.toString(), category.toString(), name.toString(), description.toString(), dailyRentalCost.toString()];
  }
}
