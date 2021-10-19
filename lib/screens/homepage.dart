
import 'package:finalpro/block/cart_bloc.dart';
import 'package:finalpro/block/cart_events.dart';
import 'package:finalpro/logic/api.dart';
import 'package:finalpro/moduls/elementfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'datails.dart';

class Homa extends StatefulWidget {
  const Homa({Key? key, int? categoryId, String? categoryName, int? categoriesId}) : super(key: key);

  @override
  _HomaState createState() => _HomaState();
}

class _HomaState extends State<Homa> {
  final GlobalKey<ScaffoldState> keys = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey,
        key: keys,
        body: Container(
          width: size.width,
          height: size.height,
          color: Colors.grey,
          child: FutureBuilder<ProductsVm>(
            future: Api.getProducts(),
            builder: (context, snapshot)
            {
              if (snapshot.connectionState == ConnectionState.done)
              {
                return GridView.count(
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2,
                  children: List.generate(
                    snapshot.data!.products!.length,
                        (index) => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                              selectedItem: snapshot.data!.products![index])));
                                },
                                child: Image(
                                  image: NetworkImage(
                                      '${snapshot.data!.products![index].avatar}'),
                                  fit: BoxFit.cover,
                                  width: size.width * 0.5,
                                  height: size.height ,
                                ),
                              )),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    '${snapshot.data!.products![index].title}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    '${snapshot.data!.products![index].name}',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                        onTap: ()
                                        {
                                          CartBloc cartBloc = BlocProvider.of(context);
                                          cartBloc.add(AddProductEvent(newProduct: snapshot.data!.products![index]));
                                        },
                                        child: Icon(Icons.add)),
                                    Text(
                                      '${snapshot.data!.products![index].price} EGP',
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              else
              {
                return Center(

                    child: CircularProgressIndicator() );
              }
            },
          ),
        ));
  }
}
