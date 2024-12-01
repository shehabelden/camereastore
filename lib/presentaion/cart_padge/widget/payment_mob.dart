import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../cubit/cubit.dart';

class PaymentMob extends StatelessWidget {
  const PaymentMob({super.key, required this.totalCardPayment,required this.cubit});
  final double totalCardPayment;
  final CartCubit cubit;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return InkWell(
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
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color:const Color(0xFFFF5900),
          border: Border.all(
              width: .2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child:Row(
          children: [
             Text("   total",style: TextStyle(
               color: Colors.white,
             ),),
            const SizedBox(width: 200,),
            Text("${totalCardPayment}",style: TextStyle(
              color: Colors.white,
            ),),
          ],
        ),
      ),

    );
  }
}
