import 'package:flutter/material.dart';
class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.homeMap});
  final Map homeMap;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
        return Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                homeMap["mainImage"]!=null?  Container(
                  height:200,
                  width: double.maxFinite,
                  decoration:  BoxDecoration(
                      image: DecorationImage(image: NetworkImage(homeMap["mainImage"]),fit:BoxFit.fill)
                  ),):Container(),
                 const  Spacer(),
                 Padding(
                   padding: const EdgeInsets.only(left: 20.0,bottom: 10),
                   child: Column(children: [
                    Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${homeMap["name"]}'),
                          const Text('camera',style: TextStyle(
                            color: Color(0xFF717171),
                            fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),
                    ],),
                               ],),
                 ),
                 Padding(
                  padding:const EdgeInsets.only(left: 20.0,bottom: 10),
                  child: Text("${homeMap["price"]}",style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ],
            ));
      }
    );
  }
}
