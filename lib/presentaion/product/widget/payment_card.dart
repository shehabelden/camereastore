import 'package:beamer/beamer.dart';
import 'package:camerastore/presentaion/home_badge/cubit/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key, required this.paymentMap, required this.cubit});
  final Map paymentMap;
  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 300,right: 20),
      child: Container(
        width: 280,
        height: 570,
        padding:const EdgeInsets.only(left: 10,right: 10) ,
        decoration: BoxDecoration(
          border: Border.all(
            width: .3,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text("  delivery",style: TextStyle(
              fontSize: 21,
            ),),
            SizedBox(
              height: 40,
            ),
            const Text("total stock:7"),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40,bottom: 20),
              child: Container(
                width: 300,
                height: 57,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 75,
                      alignment:Alignment.center,
                      child: Text("-"),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),
                      ),
                    ),
                    Container(
                      width: 150,
                      alignment:Alignment.center ,
                      color: Colors.white,
                      child: Text("0"),
                    ),
                    Container(
                      width: 75,
                      alignment:Alignment.center ,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF5900),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12)),
                      ),
                      child: Text("+"),

                    ),

                  ],
                ),
              ),
            ),
            Text("price                ${paymentMap["price"]}"),
            SizedBox(
              height: 40,
            ),
            const Text("shipping           15"),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: InkWell(
                onTap: ()async{
                  if(FirebaseAuth.instance.currentUser != null){
                    await cubit.addProductCartData(paymentMap);
                    context.beamToNamed(
                        '/cart');}else{
                    context.beamToNamed(
                        '/sign_up');
                  }
                },
                child: Container(
                  height: 50,
                  width: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:const Color(0xFFFF5900),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:const Text("Add to Card",style: TextStyle(
                      color: Colors.white
                  ),),
                ),
              ),
            ),
            const SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: InkWell(
                onTap: (){
                  if(FirebaseAuth.instance.currentUser != null){
                    context.beamToNamed(
                        '/sheeping');}else{
                    context.beamToNamed(
                        '/sign_up');
                  }
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:const Color(0xFFFF5900),
                        width: .2
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child:const Text("Add to shopping",style: TextStyle(
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}