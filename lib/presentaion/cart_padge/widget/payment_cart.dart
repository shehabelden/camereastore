import 'package:beamer/beamer.dart';
import 'package:camerastore/presentaion/cart_padge/cubit/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class PaymentCart extends StatelessWidget {
  const PaymentCart({super.key, required this.totalCardPayment, required this.cubit});
  final double totalCardPayment;
  final CartCubit cubit;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.only(bottom: 140.0,right: 20),
      child: Container(
        width: width*.1866666666666667,
        height: height*.5068493150684932,
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
            const SizedBox(height: 10,),
            const Text("  delivery",style: TextStyle(
              fontSize: 21,
            ),),
            const SizedBox(
              height: 40,
            ),
            Text("price          $totalCardPayment"),
            const SizedBox(
              height: 40,
            ),
            const Text("shipping       25"),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.only(),
              child: InkWell(
                onTap: ()async{
                  if(FirebaseAuth.instance.currentUser != null){
                   await cubit.makeOrder({
                      "order_info":cubit.cartList,
                      "total_price":cubit.totalCardPayment+15,
                    });
                    context.beamToNamed(
                        '/check_out/${cubit.orderId}');}else{
                    context.beamToNamed(
                        '/sign_up');
                  }
                },
                child: Container(
                  height: height*.0684931506849315,
                  width: width/5,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:const Color(0xFFFF5900),
                        width: .2
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child:const Text("Add to shopping"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}