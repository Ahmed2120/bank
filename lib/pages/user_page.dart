import 'package:flutter/material.dart';

import '../models/user.dart';

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _style = TextStyle(fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name:', style: _style,),
                  Text('${user.name}', style: _style,),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email:', style: _style,),
                  Text('${user.email}', style: _style,),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Address:', style: _style,),
                  Text('${user.address}', style: _style,),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Balance:', style: _style,),
                  Text('${user.balance}', style: _style,),
                ],
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                child: const Text('Transfer'),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    minimumSize: Size(double.infinity, 34)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
