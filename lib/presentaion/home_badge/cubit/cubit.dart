import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/lists/category_list.dart';
import '../../../utils/seq/Cashe.dart';
import '../../../utils/seq/cashed_vareboal.dart';
import '../model/model.dart';
import 'state.dart';

class HomeCubit extends Cubit<MainHomeState> {
  HomeCubit() : super(InitHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);
  int index = 0;
  int indexTop = 0;
  int slideIndex = 0;
  List categoryList=[];
  List categoryIdList=[];
  int cont=0;
  String CategoryFilt=CategoryLists.cameraLangItems[0];
  Map <String,dynamic>productData={};
  bool isEnglish = CachedVariables.lang == "en" ? true : false;  void slideManger(index){
    slideIndex = index;
    emit(SlideMangerState());
  }
  void categoryFiltter(index){
    CategoryFilt = index;
    emit(CategoryFiltterState());
  }

  void changeLanguageState(value) {
    isEnglish = value;
    emit(ChangeLanguageSuccessState());
  }
  void bottomBarCubit(i) {
    index = i;
    // print(index);
    emit(CustomBottomBarState());
  }
  void appLanguage(LanguageEventEnums eventType) async {
    try {
      switch (eventType) {
        case LanguageEventEnums.initiallanguage:
        // Try to get the language from shared preferences
          String? language = Cachehelper.getData(key: 'language');
          if (language != null) {
            emit(ChangeLanguage(languageCode: language)); // Emit the saved language
          } else {
            emit(ChangeLanguage(languageCode: 'en')); // Default to English if no language is saved
          }
          break;

        case LanguageEventEnums.arabiclanguage:
          await Cachehelper.saveData(key: 'language', value: 'ar');
          emit(ChangeLanguage(languageCode: 'ar'));
          break;

        case LanguageEventEnums.spanishlanguage:
          await Cachehelper.saveData(key: 'language', value: 'es');
          emit(ChangeLanguage(languageCode: 'es'));
          break;

        case LanguageEventEnums.russianlanguage:
          await Cachehelper.saveData(key: 'language', value: 'ru');
          emit(ChangeLanguage(languageCode: 'ru'));
          break;

        case LanguageEventEnums.englishlanguage:
          await Cachehelper.saveData(key: 'language', value: 'en');
          emit(ChangeLanguage(languageCode: 'en'));
          break;

        default:
          break;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error in appLanguage: $e");
      }
    }
  }

   topBarCubit(int i) {
    indexTop = i;
    print("this $i");
    print(index);
    emit(TopBottomBarState());
  }
  void getData(filter,id) async{
    emit(LoadState());
    categoryList=[];
    categoryIdList=[];
    print("this filter $filter");
    print("this id $id");
    await FirebaseFirestore.instance.collection("category")
        .doc("Photography cameras")
        .collection(filter).doc(id).collection("Product").get().then((v){
      v.docs.forEach((elmint){
        categoryList.add(elmint.data());
        categoryIdList.add(elmint.id);
      });
      print(categoryList);
    });
    emit(GerDataState());
  }
   getProductData(id) async{
    print(id);
    emit(ProductLoadState());
    await FirebaseFirestore.instance.collectionGroup("Product").get().then((v){
      v.docs.forEach((elment){
        if(elment.id==id){
        productData=elment.data();
        }

      });
      print(productData);
    });
    emit(GetProductDataState());
  }
  addProductCartData(map) async{
    await FirebaseFirestore.instance.collection("Profile").doc(FirebaseAuth.instance.currentUser!.uid).collection("Cart").add(map);
    emit(AddProductCart());
  }
plas(){
  if(cont<7){
    cont=cont+1;
  }
  print(cont);
  emit(PlasState());
}
  minas(){
    if(cont>0){
      cont--;
    }
    emit(MinasState());
  }

}
