import 'package:get/get.dart';
import 'package:todo_app/data/helpers/firebase_helper/firebase_helper.dart';
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


//Auth --> Stream 
//API --> Future (Forecfully Stream)
//Time.perd --> 5-7 
//API --> API_TOKEN ---> GET --> Server --> Return a Token , 
//SEND THIS API_TOKEN --> POST --> 