import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/helpers/firebase_helper/firebase_helper.dart';
import 'package:todo_app/models/Category_add_model/category_add_model.dart';

class CategoryAddControler extends GetxController {
  RxInt codePoint = 0.obs;
  RxString fontFamilty = ''.obs;
  RxInt colorA = 0.obs;
  RxInt colorR = 0.obs;
  RxInt colorG = 0.obs;
  RxInt colorB = 0.obs;
  var color = Colors.amber.obs;

  // Index Hilight Effect
  RxInt checkedEditedIndex = 0.obs;
  RxBool check = false.obs;

  RxList<CategoryAddModel> _listOfCategories = <CategoryAddModel>[].obs;
  List<CategoryAddModel> get listOfCategories => _listOfCategories.value;

  @override
  void onInit() {
    _listOfCategories.bindStream(getCategoryTypes());
    super.onInit();
  }

  Stream<List<CategoryAddModel>> getCategoryTypes() {
    return HelperFirebase.categroyTypeFirestoreInstance.snapshots().map(
      (event) {
        return event.docs
            .map(
              (e) => CategoryAddModel.fromMap(e.data()),
            )
            .toList();
      },
    );
  }

  void addCatagory(CategoryAddModel mobel) async {
    await HelperFirebase.categroyTypeFirestoreInstance.doc().set(mobel.toMap());
    update();
  }
}
