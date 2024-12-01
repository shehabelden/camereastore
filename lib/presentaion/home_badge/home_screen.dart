import 'package:beamer/beamer.dart';
import 'package:camerastore/presentaion/home_badge/widget/circle_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:restart_app/restart_app.dart';
import '../../utils/images.dart';
import '../../utils/lists/category_list.dart';
import '../../utils/seq/cashed_vareboal.dart';
import '../../utils/seq/seq.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'home_mob.dart';
import 'widget/DropDownNew.dart';
import 'widget/body.dart';
import 'widget/drob_down_category.dart';
import 'widget/footer.dart';
import 'widget/home_slider.dart';
import 'widget/main_header.dart';
import 'widget/search_field.dart';
import 'widget/sub_category.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit=HomeCubit.get(context);
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    if(cubit.indexTop ==0){
      cubit.getData(CategoryLists.subCategoryList[0]["Photography cameras"]![0].toString(),CategoryLists.cameraId[0].toString());
    }
    return BlocBuilder<HomeCubit,MainHomeState>(
      builder: (context,state) {
        return LayoutBuilder(
            builder: (context, constraints) {
            return constraints.maxWidth<= 600?HomeMob(): Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Image.asset(
                  Images.logo,
                  height:constraints.maxWidth <= 1200? 100: height*.1917808219178082,
                  width:constraints.maxWidth <= 1200? 100: height*.1917808219178082,
                ),
                backgroundColor: Colors.white,
                actions:  [
                 SizedBox(width: 10,),
                  DropDownCategory(cubit: cubit,),
                  SizedBox(width: 10,),
                  // DropdownNew(),
                  const SizedBox(width: 00,),
                  const SearchField(),
                  const SizedBox(width: 20,),
                  InkWell(onTap: ()async{
                    //   final easyLocalization = EasyLocalization.of(context);
                    //   if (easyLocalization != null) {
                    //     context.setLocale(const Locale("ar", ""));
                    //     // SecureStorage.saveData(key: CachedKeys.lang, value: "ar");
                    //     CachedVariables.lang = await SecureStorage.getData(
                    //       key: CachedKeys.lang,
                    //     );
                    //     // cubit.updateLanguage(lang: "ar");
                    //   }
                    //   cubit.changeLanguageState(false);
                    // setState(() async{
                    //  await context.setLocale(const Locale('ar'));
                    //
                    // });
                    // Restart.restartApp(
                    //   /// In Web Platform, Fill webOrigin only when your new origin is different than the app's origin
                    //   // webOrigin: 'http://example.com',
                    //
                    //   // // Customizing the restart notification message (only needed on iOS)
                    //   // notificationTitle: 'Restarting App',
                    //   // notificationBody: 'Please tap here to open the app again.',
                    // );
                  },child:const Text("lang"),
                  ),
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
                    Padding(
                      padding:  EdgeInsets.only(left:constraints.maxWidth <= 1200? 120:200),
                      child: MainHeader(),
                    ),
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