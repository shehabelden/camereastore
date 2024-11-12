import 'package:flutter/material.dart';

import '../../../utils/lists/images_list.dart';
import '../cubit/cubit.dart';

class CircleList extends StatelessWidget {
  const CircleList({super.key,required this.cubit});
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    final List imageList = ImagesList.caverImages;
    return SizedBox(
      height: 100,
      width: 300,
      child: ListView.builder(
        shrinkWrap: true,
         scrollDirection: Axis.horizontal,
         itemCount: imageList.length,
          itemBuilder:(c,i){
            return Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                height: 25,
                width: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color:cubit.slideIndex==i?const Color(0xFFFF5900)  :Colors.white,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding:const  EdgeInsets.all(0),
                  child: Container(
                    height: 12.5,
                    width: 12.5,
                    decoration: BoxDecoration(
                      color: cubit.slideIndex==i?const Color(0xFFFF5900)  :Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            );
      }),
    );
  }
}
