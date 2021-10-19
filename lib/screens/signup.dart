import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginpage.dart';

class Signin extends StatefulWidget {

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();

  TextEditingController _pass = TextEditingController();

  TextEditingController namec = TextEditingController();

  var ispass=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Image(
                  image: AssetImage("assets/image/amit.jpg"),
                  height: 150,
                  width: 300,
                ),
                SizedBox(
                  height: 70,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please write your name";
                          }
                          else
                            return null;
                        },
                        controller:namec,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Name",
                          prefixIcon: Visibility(
                            child: Icon(
                              Icons.home_outlined,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 30,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please write your email";
                          }
                          else
                            return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Email",
                          prefixIcon: Visibility(
                            child: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 30,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: ispass,
                        controller: _pass,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please write your password";
                          }
                          else
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
                          )

                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formkey.currentState!.validate()) {
                      var result = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _email.text,
                          password: _pass.text);
                      if (result.user != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                      } else {
                        print('try again later');
                      }
                    }
                  },
                  child:
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    "Have an account?",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );

                  },
                  child:
                  Container(
                    width: 170,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Text(
                          "Go Login",
                          style: TextStyle(color: Colors.red, fontSize: 17),
                        )),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
