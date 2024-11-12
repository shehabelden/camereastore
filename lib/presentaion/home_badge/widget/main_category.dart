import 'package:flutter/material.dart';

import '../../../utils/lists/images_list.dart';

class MainCategory extends StatelessWidget {
  const MainCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 100,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: ImagesList.categoryList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (c,i){
              return Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(ImagesList.categoryList[i]),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
