import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  const CartList({super.key, required this.cartList});
  final List cartList;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return LayoutBuilder(
        builder: (context, constraints) {
        return Container(
          height: 800,
          width:400,
          padding:const EdgeInsets.only(top: 40),
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cartList.length,
              itemBuilder: (c,i){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0,left: 10,
                  right: 10),
                  child: Container(
                    height:constraints.maxWidth<= 1200? height*.4301369863013699 : height*.2501369863013699,
                    width: width/2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:const Color(0xFFF4F4F4),
                    ),
                    child: Row(
                      children: [
                        Expanded(flex: 4,child: Container(
                          height: height*.6849315068493151,
                          width: width/3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(image: NetworkImage(cartList[i]["mainImage"]),fit: BoxFit.cover)
                          ),
                        )),
                         Expanded(flex: 6,child: Padding(
                          padding:const EdgeInsets.only(left: 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20,),
                              Text(cartList[i]["name"],style:const TextStyle(
                                fontSize: 20,
                              ),),
                              const Text("category",style: TextStyle(
                                fontSize: 20,
                              ),),
                              Text("storage",style: TextStyle(
                                fontSize: 20,
                              ),),
                              Text("color",style: TextStyle(
                                fontSize: 20,
                              ),),
                              Text(cartList[i]["price"].toString(),style: TextStyle(
                                fontSize: 20,
                              ),),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              }),
        );
      }
    );
  }
}
