class Customer{
  int id;
  String lastName;
  String firstName;
  String phone;
  String email;
  bool isBanned;
  int discount;

  Customer({required this.id, required this.lastName, required this.firstName, required this.phone, this.discount = 0, required this.email, this.isBanned = false});


  List<String> toList(){
    return[id.toString(), lastName.toString(), firstName.toString(), phone.toString(), email.toString(), isBanned.toString(), discount.toString()];
  }
}

