import 'package:cadmus/api_services/api_services.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  var apiobj = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                height: 200,
                width: 200,
                color: Colors.green,
              )),
              const Text(
                "Register",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Please register to continue",
                  style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold),
                ),
              ),
              Form(
                  child: Column(
                children: [
                  // username
                  TextFormField(
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.person),
                        hintText: "Username",
                        labelText: "Username",
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold)),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // email
                  TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.phone),
                        hintText: "email",
                        labelText: "email",
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold)),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  // password
                  TextFormField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Password",
                        labelText: "Password",
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              )),
              const SizedBox(
                height: 15,
              ),

              // loginbutton
              InkWell(
                onTap: () => apiobj.register(
                    context: context,
                    username: usernamecontroller.text,
                    email: emailcontroller.text,
                    password: passwordcontroller.text),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green),
                  child: const Padding(
                    padding: EdgeInsets.all(13),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    const Text("Already have an account  "),
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          "login ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 14),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
