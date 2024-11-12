import 'package:beamer/beamer.dart';
import 'package:camerastore/presentaion/auth/widget/auth_button.dart';
import 'package:camerastore/presentaion/auth/widget/email.dart';
import 'package:camerastore/presentaion/auth/widget/header.dart';
import 'package:camerastore/presentaion/auth/widget/passfield.dart';
import 'package:camerastore/utils/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/state.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _LoginformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Controllers.userNameController;
    Controllers.emailController;
    Controllers.passwordController;
    Controllers.passwordCheckController;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    LoginCubit cubit=LoginCubit.get(context);
    return BlocBuilder<LoginCubit,LoginState>(
        builder: (context,state) {
        return LayoutBuilder(
            builder: (context, constraints) {
            return Scaffold(
              appBar: AppBar(
                title: Image.asset(
                  "images/بروفايل سوشيال شكل 2.png",
                  height: 120,
                  width: 120,
                ),
                actions: [
                  Text("dont have an account?"),
                  InkWell(
                    onTap: () {
                      context.beamToNamed('/sign_up');
                    },
                    child: const Text(
                      "  Sign up!",
                      style: TextStyle(
                        color: Color(0xFFFF5900),
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              body: Padding(
                padding:  EdgeInsets.only(left:constraints.maxWidth <= 1200? 100: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 100.0),
                      child: const Header(),
                    ),
                     Padding(
                      padding:  EdgeInsets.only(right: 100.0,top:constraints.maxWidth <= 1200? 48:0 ),
                      child:  Text("Or continue with"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 100.0),
                      child: Form(
                        key: _LoginformKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          SizedBox(
                            width:constraints.maxWidth <= 1200? 600:width*.2533333333333333 ,
                            child: EmailField(controller: Controllers.emailController,e:cubit.emailExption),

                          ),
                          const SizedBox(height: 64,),
                          SizedBox(
                              width:constraints.maxWidth <= 1200? 600: width*.2533333333333333,
                              child: PasswordField(controller: Controllers.passwordController,)
                          ),
                        ],),
                      ),
                    ),
                    const SizedBox(height: 64,),
                    Padding(
                      padding: const EdgeInsets.only(right: 100.0),
                      child: InkWell(
                          onTap: (){
                            if (_LoginformKey.currentState!.validate()) {
                              cubit.SignInWithEamilandPass(Controllers.emailController.text,Controllers.passwordController.text);
                            }
                          },
                          child: AuthButton()),
                    )
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }
}
