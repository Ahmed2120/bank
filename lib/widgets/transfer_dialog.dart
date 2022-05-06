import 'dart:io';

import 'package:bank/provider/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';


class TransferDialog {
  final txtAmount = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  final User fromUser;

  TransferDialog(this.fromUser);

  Widget buildDialog(BuildContext context) {
    String? dropdownValue = Provider.of<Controller>(context).dropdownValue;
    return AlertDialog(
      title: const Text('Transfer Money'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
          DropdownButtonFormField<String>(
          value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? newValue) {
              Provider.of<Controller>(context, listen: false).changeDropDown(newValue);
            },
            validator: (val) {
              if (val == null) {
                return 'choose user';
              }
            },
            items: Provider.of<Controller>(context).users
                .map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value.name,
                child: Text(value.name),
              );
            }).toList(),
          ),
              TextFormField(
                controller: txtAmount,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Amount'),
                validator: (val) {
                  if (val!.isEmpty || double.tryParse(val) == null) {
                    return 'Type a valid Amount';
                  }
                },
              ),

              ElevatedButton(
                  child: const Text('Transfer'),
                  onPressed: () async {
                    if (!_formKey.currentState!.validate() || dropdownValue == null) {
                      return;
                    }
                    FocusScope.of(context).unfocus();
                    _formKey.currentState!.save();
                    Provider.of<Controller>(context, listen: false).transfer(fromUser, double.parse(txtAmount.text));
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      ),
    );
  }
}