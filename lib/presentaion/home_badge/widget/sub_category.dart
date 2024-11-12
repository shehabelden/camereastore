import 'package:flutter/material.dart';
import '../../../utils/lists/category_list.dart';
import '../cubit/cubit.dart';
class SubCategory extends StatelessWidget {
  const SubCategory({super.key,required this.cubit});
  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
      child: SizedBox(
        height: height*.0904931506849315,
        width: 500,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:CategoryLists.subCategoryList[0]["Photography cameras"]!.length,
            itemBuilder: (c,i){
              return Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10),
                child: InkWell(
                  onTap: ()async{
                   await cubit.topBarCubit(i);
                   cubit.getData(CategoryLists.subCategoryList[0]["Photography cameras"]![i],CategoryLists.cameraId[i]);
                  },
                  child: Column(
                    children: [
                      Container(
                        height: height*.0547945205479452,
                        alignment: Alignment.center,
                        padding:const EdgeInsets.only(left: 10.0,right: 10) ,
                        child: Text(CategoryLists.subCategoryList[0]["Photography cameras"]![i],style: TextStyle(
                          color: Colors.black
                        ),),
                      ),
                      cubit.indexTop ==i ?
                           Container(
                        width: 100,
                        height: 2,
                        color: Color(0xFFFF5900),
                      )
                          : Text(""),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
