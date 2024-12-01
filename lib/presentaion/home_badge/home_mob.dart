import 'package:beamer/beamer.dart';
import 'package:camerastore/presentaion/home_badge/widget/circle_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../utils/images.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'widget/DropDownNew.dart';
import 'widget/body.dart';
import 'widget/drob_down_category.dart';
import 'widget/footer.dart';
import 'widget/home_slider.dart';
import 'widget/search_field.dart';
import 'widget/sub_category.dart';
class HomeMob extends StatelessWidget {
  const HomeMob({super.key});
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit=HomeCubit.get(context);
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return BlocBuilder<HomeCubit,MainHomeState>(
        builder: (context,state) {
          return LayoutBuilder(
              builder: (context, constraints) {
                return Scaffold(
                  backgroundColor: Colors.white,
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
                  body: SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HomeSlider(cubit: cubit,),
                            Padding(
                              padding:  EdgeInsets.only(left:constraints.maxWidth <= 1200? 120:200),
                              child: CircleList(cubit: cubit,),
                            ),
                            // Padding(
                            //   padding:  EdgeInsets.only(left:constraints.maxWidth <= 1200? 120:200),
                            //   child: MainHeader(),
                            // ),
                            // const MainCategory(), // all main category like pc and ps
                            SubCategory(cubit: cubit,),
                            state is LoadState || cubit.categoryList.isEmpty ? const SizedBox(height:400,child: Center(child: CircularProgressIndicator(),)) : Body(cubit: cubit),
                            const Footer(),
                          ],
                        ),
                      )),
                );
              }
          );
        }
    );
  }
}