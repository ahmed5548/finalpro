import 'package:finalpro/logic/api.dart';
import 'package:finalpro/moduls/categoryfile.dart';
import 'package:finalpro/screens/bottomnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categories_product.dart';
import 'homepage.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
       appBar: AppBar(
         leading: IconButton(
             icon: Icon(Icons.arrow_back),
             onPressed: () {
               Navigator.push(  context,
                 MaterialPageRoute(builder: (context) => Home()),);
             }),
         title: Text("category"),
         centerTitle: true,
       ),
        backgroundColor: Colors.grey,
        body: FutureBuilder<CategoriesVm>(
          future: Api.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: size.width * .03,
                    crossAxisSpacing: size.width * .03,
                    children: List.generate(
                      snapshot.data!.categories!.length,
                      (index) => Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              spreadRadius: 1,
                              blurRadius: 1,
                            )
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoriesProduct(
                                      categoriesId: snapshot
                                          .data!.categories![index].id,
                                      categoryName: snapshot
                                          .data!.categories![index].name,
                                    )));
                          },
                          child: Stack(
                            children: [
                              Image(
                                image: NetworkImage(
                                    '${snapshot.data!.categories![index].avatar}'),
                                fit: BoxFit.fill,
                                width: size.width * .5,
                                height: size.height * .5,
                              ),
                              Center(
                                child: Container(
                                    color: Colors.black.withOpacity(.5),
                                    child: Text(
                                      '${snapshot.data!.categories![index].name}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * 0.06),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              );
            } else
              return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
