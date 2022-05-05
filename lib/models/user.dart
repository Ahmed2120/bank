class User{
  final int? id;
  final String name;
  final String email;
  final String address;
  final double balance;

  User(this.id, this.name, this.email, this.address, this.balance);

  User.fromJson(Map<String, dynamic> json)
  : id = json['id'],
        name = json['name'],
        email = json['email'],
        address = json['address'],
        balance = json['balance'];

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'balance': balance,
    };
  }
}