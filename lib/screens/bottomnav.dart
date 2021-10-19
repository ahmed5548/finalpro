import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'category.dart';
import 'homepage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int current = 0;
  List<Widget> lista = [
    Homa(),
    CategoriesScreen(),
    cart(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lista[current],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: 0,
        onTap:ontap ,

        unselectedLabelStyle: TextStyle(color: Colors.black),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: current == 0 ? Colors.blue : Colors.black,
                size: 25,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 20,
                  color: current == 0 ? Colors.blue : Colors.black,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(
          Icons.category_outlined,
                color: current == 1 ? Colors.blue : Colors.black,
                size: 25,
    ),
              title: Text(
                "Category",
                style: TextStyle(fontSize: 20 , color: current == 1 ? Colors.blue : Colors.black,),
              )),
          BottomNavigationBarItem(
              icon:Icon(
                Icons.shopping_cart_outlined,
                color: current == 2 ? Colors.blue : Colors.black,
                size: 25,
              ),
               title: Text(
               "Cart",
                style: TextStyle(fontSize: 20 , color: current == 2 ? Colors.blue : Colors.black,),
               )
          ),
        ],
      ),
    );
  }
  void ontap(int index){
    setState(() {
      current=index;
    });
  }
}
