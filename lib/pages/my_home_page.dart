import 'package:bank/db/userRepository.dart';
import 'package:bank/pages/user_page.dart';
import 'package:bank/provider/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();

    // insertUsers();
    getUsers();
  }

  void insertUsers() async {
    UserRepository userRepository = UserRepository();
    userRepository.insert(User(1, 'Ahmad', 'ahmad@gmail.com', 'egypt', 5000));
    userRepository
        .insert(User(2, 'Mahmoud', 'Mahmoud@gmail.com', 'egypt', 3000));
    userRepository.insert(User(3, 'Sayed', 'Sayed@gmail.com', 'egypt', 4000));
    userRepository
        .insert(User(4, 'Johannes', 'Johannes@gmail.com', 'Britain', 10000));
    userRepository.insert(User(5, 'Sara', 'Sara@gmail.com', 'egypt', 2000));
    userRepository.insert(User(6, 'Salma', 'Salma@gmail.com', 'egypt', 6000));
    userRepository.insert(User(7, 'Basem', 'Basem@gmail.com', 'egypt', 7000));
    userRepository.insert(User(8, 'Talal', 'ahmad@gmail.com', 'Saudi', 9000));
    userRepository.insert(User(9, 'Basma', 'ahmad@gmail.com', 'egypt', 2500));
    userRepository
        .insert(User(10, 'Mostafa', 'ahmad@gmail.com', 'egypt', 1000));
  }

  void getUsers() async {
    Provider.of<Controller>(context, listen: false).getUsers();
  }

  @override
  Widget build(BuildContext context) {
    users = Provider.of<Controller>(context).users;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff024b03),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              color: Color(0xff4b7cd9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text('Balance',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserPage(
                            user: users[index],
                          )));
                    },
                    splashColor: Color(0xff98b4e5),
                    child: Ink(
                      padding: EdgeInsets.all(15),
                      color: index % 2 == 0
                          ? Color(0xffecf5f5)
                          : Color(0xffD6EEEE),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${users[index].name}',
                              style: TextStyle(fontSize: 20)),
                          Text('${users[index].balance}',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}