import 'dart:convert';

import 'package:desafio_de_4/Screens/main_screen.dart';
import 'package:desafio_de_4/user_template.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class NetworkingTransformer extends StatelessWidget {
  const NetworkingTransformer({super.key});

  @override
  Widget build(BuildContext context) {
    return const UsersSummary();
  }
}

Future<List<User>> getUsers() async {
  final Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    List<User> users = jsonData.map((json) => User.fromJson(json)).toList();
    return users;
  } else {
    throw Exception('Failed to load user');
  }
}

class UsersSummary extends StatefulWidget {
  const UsersSummary({super.key});

  @override
  State<UsersSummary> createState() => _UsersSummaryState();
}

class _UsersSummaryState extends State<UsersSummary> {
  List<User> usersLocal = [];
  @override
  void initState() {
    super.initState();
    getUsers().then((users) {
      setState(() {
        usersLocal = users;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio de 4'),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return ListTile(
          title: Text(usersLocal[index].name),
          subtitle: Text(usersLocal[index].email),
          trailing: Text(usersLocal[index].phone),
        );
      }, itemCount: usersLocal.length,),
      drawer: const DrawerContainer(),
    );
  }
}
