import 'package:flutter/material.dart';

import '../../../utils/images.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.imageData});
  final Map imageData;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    List imagesList=imageData["images"];
    List relatedList=imageData["related_product"];
    return  Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height:height* .5479452054794521,
            width: width/3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageData["mainImage"]),
                  fit: BoxFit.cover
              ),
            ),
          ),
          const SizedBox(height: 100,),
          Text("product images",style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 10,),
          SizedBox(
            width: 600,
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: imagesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c,i){
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      height: 130,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imagesList[i]),
                            fit: BoxFit.fill
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 100,),
          Text("related Product",style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 10,),
          SizedBox(
            width: 600,
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: relatedList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (c,i){
                  return Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: Container(
                      height: 130,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(relatedList[i]["image"]),
                            fit: BoxFit.fill
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
