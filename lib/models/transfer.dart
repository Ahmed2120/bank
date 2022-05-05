class Transfer{
  final String? id;
  final String from;
  final String to;
  final double amount;

  Transfer(this.from, this.to, this.amount, this.id);

  Transfer.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        from = json['from'],
        to = json['to'],
        amount = json['amount'];

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'from': from,
      'to': to,
      'amount': amount,
    };
  }
}