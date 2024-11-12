import 'package:beamer/beamer.dart';
import 'package:camerastore/presentaion/home_badge/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'home_card.dart';
class Body extends StatelessWidget {
  const Body({super.key, required this.cubit});
  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
                width: width*.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    const Text("Pest Products for sale",style: TextStyle(
                      fontSize: 20,
                    ),),
                    SizedBox(height: 20,),
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:constraints.maxWidth <= 1200? 2:4,
                            crossAxisSpacing:constraints.maxWidth <= 1200? 20:120,
                            mainAxisSpacing: 30,
                          mainAxisExtent:constraints.maxWidth <= 1200?310:410,
                        ),
                        shrinkWrap: true,
                        itemCount: 8, // Number of items in the grid
                        itemBuilder: (context, index) {
                          return  InkWell(
                            onTap: (){
                              context.beamToNamed("Category/${cubit.categoryIdList[index]}");
                            },
                              child: HomeCard(homeMap:cubit.categoryList[0])
                          );
                        }),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
        );
      }
    );
  }
}
