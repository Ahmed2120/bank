import 'dart:ffi';

import 'package:bank/models/transfer.dart';
import 'package:flutter/material.dart';

import '../db/transferRepository.dart';
import '../db/userRepository.dart';
import '../models/user.dart';

class Controller extends ChangeNotifier{

  List<User> users = [];
  String? dropdownValue;

  void changeDropDown(value) async{
    dropdownValue = value;
    notifyListeners();
  }

  void getUsers() async {
    users = [];
    UserRepository userRepository = UserRepository();
    users = await userRepository.retrieve();
    notifyListeners();
  }

  Future transfer(User fromUser, double amount) async{
    User toUser = users.firstWhere((element) => element.name == dropdownValue);
    UserRepository userRepository = UserRepository();
    fromUser.balance = fromUser.balance - amount;
    toUser.balance = toUser.balance + amount;
    userRepository.update(fromUser);
    userRepository.update(toUser);
    TransferRepository transferRepository = TransferRepository();
    Transfer transfer = Transfer(fromUser.name, toUser.name, amount);
    transferRepository.insert(transfer);
    for(int i=0; i<users.length; i++){
      print('users: ${users[i].name}');}
    getUsers();
  }

}