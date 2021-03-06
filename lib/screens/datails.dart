import 'package:finalpro/block/cart_bloc.dart';
import 'package:finalpro/block/cart_events.dart';
import 'package:finalpro/moduls/elementfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatefulWidget {
  Product selectedItem;
  ProductDetails({required this.selectedItem});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  void initState() {
    widget.selectedItem.amount =1;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    '${widget.selectedItem.avatar}',
                    height: size.height * 0.4,
                    width: size.width,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.selectedItem.title.toString(),
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.selectedItem.name.toString(),
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height: 1,
                    width: size.width,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.selectedItem.price.toString() + "EGP",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.red),
                      ),
                      InkWell(
                          onTap: ()
                          {
                            setState(() {
                              widget.selectedItem.amount = widget.selectedItem.amount! +1;
                            });
                          },child: Icon(Icons.add)),
                      Text(
                        "${widget.selectedItem.amount}",
                        style: TextStyle(fontSize: 20),
                      ),
                      InkWell(
                          onTap: ()
                          {
                            if(widget.selectedItem.amount! > 1)
                            {
                              setState(() {
                                widget.selectedItem.amount = widget.selectedItem.amount! -1;
                              });
                            }
                          },child: Icon(Icons.remove)),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height: 1,
                    width: size.width,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    widget.selectedItem.description.toString(),
                    style: const TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                      CartBloc cartBloc = BlocProvider.of(context);
                      cartBloc.add(AddProductEvent(newProduct: widget.selectedItem));
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: size.width * 0.9,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red),
                      child: Center(
                        child: Text(
                          "add to card",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }


}
