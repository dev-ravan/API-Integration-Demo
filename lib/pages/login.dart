import 'package:demo/Data/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, auth, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Role ID")),
                  controller: auth.roleId,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Email ID")),
                  controller: auth.emailId,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Password")),
                  controller: auth.password,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                    onPressed: () => auth.loginApi().then((value) {
                          if (value["status"] == true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(value["message"])));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(value["message"])));
                          }
                        }),
                    icon: const Icon(Icons.add),
                    label: const Text("Login"))
              ],
            ),
          ));
    });
  }
}
