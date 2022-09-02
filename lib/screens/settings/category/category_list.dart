import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mosaic_event/screens/settings/category/update_add_category.dart';
import 'package:mosaic_event/services/cloud_service.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    final cloudService = Provider.of<CloudService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Category'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: cloudService.categoryCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong! ${snapshot.error}");
          } else if (snapshot.hasData) {
            if (snapshot.data!.docs.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Text(snapshot.data!.docs[index]['cateName']),
                    subtitle: Text(snapshot.data!.docs[index]['cateId']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateOrAddCategory(
                                    cateId: snapshot.data!.docs[index]
                                        ['cateId'],
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                            )),
                        IconButton(
                            onPressed: () {
                              deleteCategory(
                                  snapshot.data!.docs[index]['cateId']);
                            },
                            icon: const Icon(
                              Icons.delete,
                            ))
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                  child: Text(
                "Sorry, There is no data right now.\nPlease add some categories first.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ));
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UpdateOrAddCategory()),
            );
          },
          child: const Icon(Icons.add)),
    );
  }

  deleteCategory(cateId) {
    final cloudService = Provider.of<CloudService>(context, listen: false);
    cloudService.categoryCollection.doc(cateId).delete().whenComplete(() {
      Fluttertoast.showToast(msg: "Category Deleted");
    });
  }
}
