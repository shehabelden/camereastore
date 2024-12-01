import 'package:beamer/beamer.dart';
import 'package:camerastore/presentaion/product/widget/product_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../utils/images.dart';
import '../home_badge/cubit/cubit.dart';
import '../home_badge/cubit/state.dart';
import '../home_badge/widget/DropDownNew.dart';
import '../home_badge/widget/drob_down_category.dart';
import '../home_badge/widget/footer.dart';
import '../home_badge/widget/search_field.dart';
import 'widget/payment_card.dart';
class ProductMob extends StatelessWidget {
  const ProductMob({super.key, required this.id});
  final String  id;
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit=HomeCubit.get(context);
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return LayoutBuilder(
        builder: (context, constraints) {
        return BlocBuilder<HomeCubit,MainHomeState>(
            builder: (context,state) {
              return Scaffold(
                appBar: AppBar(
                  title: Image.asset(
                    Images.logo,
                    height:constraints.maxWidth <= 1200? 100: height*.1917808219178082,
                    width:constraints.maxWidth <= 1200? 100: height*.1917808219178082,
                  ),
                  backgroundColor: Colors.white,
                ),
                drawer: Drawer(
                  backgroundColor: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100,),
                      const SearchField(),
                      SizedBox(height: 10,),
                      DropDownCategory(cubit: cubit,),
                      SizedBox(height: 10,),
                      DropdownNew(),
                      const SizedBox(height: 20,),
                      InkWell(onTap: (){
                        if(FirebaseAuth.instance.currentUser != null){
                          context.beamToNamed(
                              '/cart');}else{
                          context.beamToNamed(
                              '/sign_up');
                        }
                      }, child:const Icon(IconlyLight.buy, )),
                      const SizedBox(width: 50,),
                      constraints.maxWidth <= 1200? SizedBox(): SizedBox(width: width*.1302083333333333,),
                    ],
                  ),
                ),
                backgroundColor: Colors.white,
                body:state is ProductLoadState || cubit.productData.isEmpty ?
                SizedBox(height:400,child: Center(child: CircularProgressIndicator(),)):
                SizedBox(
                  height: 1200,
                  width: 360,
                  child: SingleChildScrollView(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 40,),
                        SizedBox(
                          height: 2700,
                          width: 360,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: ProductImage(imageData:cubit.productData,),
                              ),
                              Expanded(flex: 2,child: Padding(
                                padding: const EdgeInsets.only(bottom: 60.0,left: 20,top: 150),
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
                              Expanded(flex:constraints.maxWidth<= 600?1:2,child: PaymentCard(paymentMap: cubit.productData, cubit: cubit,)),
                            ],
                          ),
                        ),
                        const Footer()
                      ],
                    ),
                  ),
                ),
              );
            }
        );
      }
    );
  }
}
