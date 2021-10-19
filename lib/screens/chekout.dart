import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Check Out"),
        centerTitle: true,
      ),
body: Container(color: Colors.red,),
    );
  }
}
