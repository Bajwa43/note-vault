import 'package:get/get.dart';
import 'package:todo_app/utiles/helpers/firebase_helper/firebase_helper.dart';
import 'package:todo_app/models/Category_add_model/category_add_model.dart';

class CategoryController extends GetxController {
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
}
