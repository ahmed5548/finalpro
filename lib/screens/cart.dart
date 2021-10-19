import 'package:finalpro/block/cart_bloc.dart';
import 'package:finalpro/block/cart_events.dart';
import 'package:finalpro/block/cart_states.dart';
import 'package:finalpro/screens/chekout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is LoadedState) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
                  height: size.height,
                  width: size.width,
                  child: ListView.builder(
                      itemCount: state.shoppingCart.length,
                      itemBuilder: (context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //image only
                                Expanded(
                                  child: Image(
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          '${state.shoppingCart[index].avatar}')),
                                  flex: 3,
                                ),
                                SizedBox(
                                  width: 10,
                                ),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              state.shoppingCart[index].title
                                                  .toString(),
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            flex: 5,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                CartBloc cartBloc =
                                                    BlocProvider.of(context);
                                                cartBloc.add(DeleteProductEvent(
                                                    newProduct: state
                                                        .shoppingCart[index]));
                                              },
                                              child: Icon(
                                                Icons.clear_outlined,
                                                size: 30,
                                              ),
                                            ),
                                            flex: 1,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          state.shoppingCart[index].name
                                              .toString(),
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          overflow: TextOverflow.ellipsis),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            state.shoppingCart[index].price
                                                    .toString() +
                                                "EGP",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                padding: EdgeInsets.all(3)),
                                            child: Icon(
                                              Icons.remove,
                                              size: 20,
                                            ),
                                            onPressed: () {
                                              CartBloc cartBloc =
                                                  BlocProvider.of(context);
                                              cartBloc.add(
                                                  DecrementProductCountEvent(
                                                      productIndex: index));
                                            },
                                          ),
                                          Text(
                                            state.shoppingCart[index].amount
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                padding: EdgeInsets.all(3)),
                                            child: Icon(
                                              Icons.add,
                                              size: 20,
                                            ),
                                            onPressed: () {
                                              CartBloc cartBloc =
                                                  BlocProvider.of(context);
                                              cartBloc.add(
                                                  IncrementProductCountEvent(
                                                      productIndex: index));
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  flex: 7,
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 4,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      }),
                ),
                flex: 9,
              ),
              Expanded(
                child: Container(
                  child: MaterialButton(
                    onPressed: () {
                      CartBloc cartBloc = BlocProvider.of(context);
                      cartBloc.add(ClearCartEvent());
                      setState(() {});
                    },
                    child: Text(
                      'clear cart',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.blue,
                  ),
                ),
                flex: 1,
              ),
            ],
          );
        } else {
          return Center(
            child: Text(
              "NO Item Selected",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          );
        }
      }),
    );
  }
}
