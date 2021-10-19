import 'package:finalpro/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottomnav.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();

  TextEditingController _pass = TextEditingController();

  var ispass = true;

  void dispose() {
    _email.dispose();
    _pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Image(
                  image: AssetImage("assets/image/amit.jpg"),
                  width: 300,
                  height: 150,
                  fit: BoxFit.fill),
              SizedBox(
                height: 70,
              ),
              Form(
                key: _formkey,
                child: Column(children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please write email";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Email",
                        prefixIcon: Visibility(
                          child: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(

                    controller: _pass,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: ispass,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please write pass";
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: "Password",
                        prefixIcon: Visibility(
                          child: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: ispass
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {setState(() {
                            ispass=!ispass ;
                          });},
                        )),
                  ),
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  if (_formkey.currentState!.validate()) {
                    var result = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _email.text, password: _pass.text);

                    if (result.user != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                          (route) => false);
                    } else {
                      print("user not founded");
                    }
                  }
                },
                child: Container(
                  width: 170,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signin()),
                  );
                },
                child: Container(
                  width: 170,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Text(
                    "Go SignUp",
                    style: TextStyle(color: Colors.red, fontSize: 17),
                  )),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
