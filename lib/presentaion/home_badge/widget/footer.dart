import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'search_field.dart';
class Footer extends StatelessWidget {
  const Footer({super.key});
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return LayoutBuilder(
        builder: (context, constraints) {
        return Container(
          color: Colors.white,
          height: height*.5479452054794521,
          width: double.infinity,
          padding:const EdgeInsets.only(left: 20,top: 20),
          child: Row(
            children: [
              Expanded(flex: 1,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact us",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                  SizedBox(height: height*.0410958904109589,),
                  Text("01009844975",style: TextStyle(

                  ),),
                  SizedBox(height: height*.0410958904109589,),
                  Text("01019808587",style: TextStyle(
                  ),),
                  SizedBox(height: height*.0410958904109589,),
                  SizedBox(
                    width:constraints.maxWidth <= 1200?100: 200,
                    child: Text("Address: 12 Youssef El Gendy, next to the Greek Sanctuary -- above El Tahrir Koshary, El Tahrir Street, in front of Radio Maged -- Bab El Louk -- Downtown",style: TextStyle(
                    ),),
                  ),
                ],
              ),),
              Expanded(flex: 1,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("main Category",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                  ),),
                  SizedBox(height: height*.0410958904109589,),
                  Text("camera",style: TextStyle(
                ),),
                  SizedBox(height: height*.0410958904109589,),
                  Text("lenses",style: TextStyle(
                ),),
                  SizedBox(height: height*.0410958904109589,),
                  Text("Lighting equipment",style: TextStyle(
                ),),
                  SizedBox(height: 50,),
                  Text("accessories",style: TextStyle(
                ),),
                  SizedBox(height: height*.0410958904109589,),
              ],),),
              Expanded(flex: 1,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Terms and Conditions",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                  SizedBox(height: height*.0410958904109589,),
                  Text("Shipping Terms and Conditions",style: TextStyle(
                  ),),
                  SizedBox(height: height*.0410958904109589,),
                  Text("Terms and Conditions for Purchase",style: TextStyle(
                  ),),
                ],
              ),),
              Expanded(flex: 1,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 30,),
                  const SearchField(),
                  const SizedBox(height: 30,),
                  const Text("social media",style: TextStyle(
                ),
                  ),
                      constraints.maxWidth <= 1200?Container(
                        width: 100,
                        child: Row(
                          children: [
                            InkWell(onTap: (){}, child: Icon(FontAwesomeIcons.instagram,size: 18,)),
                            SizedBox(width: 10,),
                            InkWell(onTap: (){}, child: Icon(FontAwesomeIcons.facebook,size: 18,)),
                            SizedBox(width: 10,),
                            InkWell(onTap: (){}, child: Icon(FontAwesomeIcons.tiktok,size: 18,)),
                          ],
                        ),
                      ):Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.instagram,size: 12,)),
                      IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.facebook,size: 12,)),
                      IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.tiktok,size: 12,)),
                    ],
                  ),
                ],),),
            ],
          ),
        );
      }
    );
  }
}
