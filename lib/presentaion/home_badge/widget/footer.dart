import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
                            InkWell(onTap: ()async{
                              await launchUrl(Uri.parse(
                                  'https://www.instagram.com/lord.technology98/?fbclid=IwY2xjawG5IpdleHRuA2FlbQIxMAABHaKjgkuvJveGhVIOqK_3bzIBngHwfkSsWIciHbvaBoAr0R21bnhA915Dzw_aem_zdM6L3QYbHVidS8ipOGU7w#'));

                            }, child: Icon(FontAwesomeIcons.instagram,size: 18,)),
                            SizedBox(width: 10,),
                            InkWell(onTap: ()async{
                              await launchUrl(Uri.parse(
                                  'https://www.facebook.com/profile.php?id=61562961732993'));

                            }, child: Icon(FontAwesomeIcons.facebook,size: 18,)),
                            SizedBox(width: 10,),
                            InkWell(onTap: ()async{
                              await launchUrl(Uri.parse("https://www.tiktok.com/@lordtechnology98?fbclid=IwY2xjawG5I0tleHRuA2FlbQIxMAABHQcQ6_cBbny0ulvz2vhaUENdY05l1lzlBrpx0fUoL6hkWgSMxwXAfYb3GA_aem_DmYNd5Fe-tNQv0tqHkxAnA"));
                              }, child: Icon(FontAwesomeIcons.tiktok,size: 18,)),
                          ],
                        ),
                      ):Row(
                    children: [
                      IconButton(onPressed: ()async{
                        await launchUrl(Uri.parse(
                            'https://www.instagram.com/lord.technology98/?fbclid=IwY2xjawG5IpdleHRuA2FlbQIxMAABHaKjgkuvJveGhVIOqK_3bzIBngHwfkSsWIciHbvaBoAr0R21bnhA915Dzw_aem_zdM6L3QYbHVidS8ipOGU7w#'));

                      }, icon:const Icon(FontAwesomeIcons.instagram,size: 12,)),
                      IconButton(onPressed: ()async{
                        await launchUrl(Uri.parse(
                            'https://www.facebook.com/profile.php?id=61562961732993'));
                      }, icon:const Icon(FontAwesomeIcons.facebook,size: 12,)),
                      IconButton(onPressed: ()async{
                        await launchUrl(Uri.parse("https://www.tiktok.com/@lordtechnology98?fbclid=IwY2xjawG5I0tleHRuA2FlbQIxMAABHQcQ6_cBbny0ulvz2vhaUENdY05l1lzlBrpx0fUoL6hkWgSMxwXAfYb3GA_aem_DmYNd5Fe-tNQv0tqHkxAnA"));
                      }, icon:const Icon(FontAwesomeIcons.tiktok,size: 12,)),
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
