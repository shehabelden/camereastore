import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../cubit/cubit.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    LoginCubit cubit=LoginCubit.get(context);
    return LayoutBuilder(
        builder: (context, constraints) {
        return Container(
          width: width*.4,
          height:constraints.maxWidth <= 1200? 300: height*.2465753424657534,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "Get Started With Lord Camera Store",
                style: TextStyle(
                  fontSize:constraints.maxWidth <= 1200? 20:30,
                  fontWeight: FontWeight.bold,
                ),
              ),
               Text(
                "Getting started is easy",
                style: TextStyle(
                  fontSize:constraints.maxWidth <= 1200? 10: 20,
                  color: Color(0xFF7E7E7E),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child:constraints.maxWidth <= 1200? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: ()async{
                        cubit.googleAuth();
                      },
                      child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFFF5900),
                                width: .2,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          padding:
                          EdgeInsets.only(left: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Image.asset("images/google 1.png"),
                              SizedBox(
                                width: 10,
                              ),
                              Text("google"),
                            ],
                          )),
                    ),
                    SizedBox(height: 20,),
                    Container(
                        width: 200,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFFF5900),
                              width: .2,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        padding:
                        EdgeInsets.only(left: 20, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Image.asset("images/facebook1.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Text("facebook"),
                          ],
                        )),
                  ],
                ): Row(
                  children: [
                    InkWell(
                      onTap: ()async{
                        cubit.googleAuth();
                      },
                      child: Container(
                          width: width*.1333333333333333,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFFF5900),
                                width: .2,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          padding:
                          EdgeInsets.only(left: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Image.asset("images/google 1.png"),
                              SizedBox(
                                width: 10,
                              ),
                              Text("google"),
                            ],
                          )),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                        width: 200,
                        padding:
                        EdgeInsets.only(left: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFDEDEDE),
                              width: .2,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Image.asset("images/facebook1.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Text("facebook"),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
