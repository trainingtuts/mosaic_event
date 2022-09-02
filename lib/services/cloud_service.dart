import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mosaic_event/models/category_model.dart';

class CloudService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // GET: Users Collection
  CollectionReference get usersCollection =>
      _firebaseFirestore.collection('users');

  // GET: Category Collection
  CollectionReference get categoryCollection =>
      _firebaseFirestore.collection('categories');

  // GET: Category By ID
  getCategoryById({required String cateId}) =>
      categoryCollection.doc(cateId).get();

  // ADD: Category to firestore
  Future addCategory(String categoryName) async {
    final cateId =
        'cate_${DateTime.now().millisecondsSinceEpoch}'; // For unique id

    // calling our cate_model
    CategoryModel categoryModel = CategoryModel();
    categoryModel.cateId = cateId;
    categoryModel.cateName = categoryName;

    await categoryCollection
        .doc(cateId)
        .set(categoryModel.toMap())
        .whenComplete(() {
      Fluttertoast.showToast(msg: "Category $categoryName Added");
    });
  }

  // UPDATE: Category to firestore
  Future updateCategory(
      {required String cateId, required String categoryName}) async {
    await categoryCollection.doc(cateId).update({
      'cate_name': categoryName,
    }).whenComplete(() {
      Fluttertoast.showToast(msg: "Category Updated");
    }).catchError((error) {
      Fluttertoast.showToast(msg: "Error occured: $error");
    });
  }
}
