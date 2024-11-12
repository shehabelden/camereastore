import 'package:beamer/beamer.dart';
import 'package:camerastore/presentaion/product/widget/product_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/images.dart';
import '../home_badge/cubit/cubit.dart';
import '../home_badge/cubit/state.dart';
import '../home_badge/widget/footer.dart';
import '../home_badge/widget/search_field.dart';
import 'widget/payment_card.dart';
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.id});
  final String  id;
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit=HomeCubit.get(context);
    cubit.getProductData(id);
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return BlocBuilder<HomeCubit,MainHomeState>(
        builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset(
              Images.logo,
              height: height*.1917808219178082,
              width: height*.1917808219178082,
            ),
            backgroundColor: Colors.white,
            actions:  [
              InkWell(onTap: (){
                if(FirebaseAuth.instance.currentUser != null){
                  context.beamToNamed(
                      '/cart');}else{
                  context.beamToNamed(
                      '/sign_up');
                }
              }, child:const Icon(Icons.shopping_cart,color: Color(0xFFFF5900), )),
              SizedBox(width: 50,),
              const SearchField(),
              SizedBox(width: width*.1302083333333333,),
            ],
          ),
          backgroundColor: Colors.white,
          body:state is ProductLoadState || cubit.productData.isEmpty ? SizedBox(height:400,child: Center(child: CircularProgressIndicator(),)): SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ProductImage(imageData:cubit.productData ,),
                    ),
                    Expanded(flex: 1,child: Padding(
                      padding: const EdgeInsets.only(bottom: 560.0,left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cubit.productData["name"],style:const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(height: 40,),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: cubit.productData["info"].length,
                                    itemBuilder: (c,i){
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    child: Text(". ${cubit.productData["info"][i]}"),
                                  );
                                }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child:cubit.productData["sizes"]==null? SizedBox(): ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder:(c,i){
                              return  Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  width: 70,
                                  alignment: Alignment.center,
                                  child: Text("65 size"),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      width: .2,
                                      color:Colors.black
                                    )
                                  ),
                                ),
                              );
                            } ,),
                          )
                        ],
                      ),
                    ),
                    ),
                    Expanded(flex: 1,child: PaymentCard(paymentMap: cubit.productData, cubit: cubit,)),
                  ],
                ),
               const Footer()
              ],
            ),
          ),
        );
      }
    );
  }
}
