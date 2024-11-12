import 'package:camerastore/presentaion/cart_padge/cubit/cubit.dart';
import 'package:flutter/material.dart';
class CheckOutContainer extends StatelessWidget {
  const  CheckOutContainer({super.key, required this.cubit, required this.shapingId, required this.userData});
  final CartCubit cubit;
  final String shapingId;
  final Map userData;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 140.0,right: 20),
      child: Container(
        width: 280,
        height: 370,
        padding:const EdgeInsets.only(left: 10,right: 10) ,
        decoration: BoxDecoration(
          border: Border.all(
            width: .3,
            color: Color(0xFFA3A3A3),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            const Text("  Order Summery",style: TextStyle(
              fontSize: 21,
            ),),
            const SizedBox(
              height: 40,
            ),
             Text("total price         ${cubit.orderMap["total_price"]}"),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.only(),
              child: InkWell(
                onTap: (){
                  cubit.updateOrder(userData,shapingId);
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:const Color(0xFFFF5900),
                        width: .6
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child:const Text("buy order"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}