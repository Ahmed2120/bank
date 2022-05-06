import 'package:flutter/material.dart';

import '../models/user.dart';
import '../widgets/transfer_dialog.dart';

class UserPage extends StatefulWidget {
  final User user;

  const UserPage({Key? key, required this.user}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    TextStyle _style = TextStyle(fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
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
                  Text('${widget.user.name}', style: _style,),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email:', style: _style,),
                  Text('${widget.user.email}', style: _style,),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Address:', style: _style,),
                  Text('${widget.user.address}', style: _style,),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Balance:', style: _style,),
                  Text('${widget.user.balance}', style: _style,),
                ],
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                child: const Text('Transfer'),
                onPressed: () {
                  TransferDialog dialog = TransferDialog(widget.user);
                  showDialog(
                      context: context,
                      builder: (context) => dialog.buildDialog(context)).then((value) {
                        setState(() {

                        });
                  });
                },
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
