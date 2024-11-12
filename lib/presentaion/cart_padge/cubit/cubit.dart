import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';
class CartCubit extends Cubit<MainCartState> {
  CartCubit() : super(InitCartState());
  static CartCubit get(context) => BlocProvider.of(context);
  double totalCardPayment = 0;
  List cartList=[];
  String orderId="";
  Map<String,dynamic> orderMap={};

  getCartData() async{
    totalCardPayment = 0;
    cartList.clear();
    await FirebaseFirestore.instance.collection("Profile").doc("YZRCNNbfCaZUcIPlVhEZTHn2Jt42").collection("Cart").get().then((v){
      v.docs.forEach((elment){
        cartList.add(elment.data());
        totalCardPayment += elment.data()["price"];
      });
    });
    print(cartList);
    emit(GetCartDataState());
  }
  makeOrder(map)async{
  await FirebaseFirestore.instance.collection("Profile")
        .doc(FirebaseAuth.instance.currentUser!.uid).collection("order").add(map).then((v){
          orderId=v.id;
  });
  emit(AddOrderDataState());
  }
  getOrderData(id) async{
    await FirebaseFirestore.instance.collection("Profile").doc(FirebaseAuth.instance.currentUser!.uid).collection("order").doc(id).get().then((v){
      orderMap=v.data()!;
    });
    print(cartList);
    emit(GetCartDataState());
  }
  updateOrder(map,id)async{
    await FirebaseFirestore.instance.collection("Profile")
        .doc(FirebaseAuth.instance.currentUser!.uid).collection("order").doc(id).update(map);
    emit(UpdateOrderDataState());
  }

}
