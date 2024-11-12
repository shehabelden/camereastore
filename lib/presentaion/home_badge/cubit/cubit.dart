import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class HomeCubit extends Cubit<MainHomeState> {
  HomeCubit() : super(InitHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);
  int index = 0;
  int indexTop = 0;
  int slideIndex = 0;
  List categoryList=[];
  List categoryIdList=[];
  Map <String,dynamic>productData={};
  void slideManger(index){
    slideIndex = index;
    emit(SlideMangerState());
  }
  void bottomBarCubit(i) {
    index = i;
    // print(index);
    emit(CustomBottomBarState());
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

}
