import 'package:camerastore/presentaion/auth/widget/email.dart';
import 'package:camerastore/presentaion/auth/widget/passcheckfield.dart';
import 'package:camerastore/presentaion/auth/widget/passfield.dart';
import 'package:camerastore/presentaion/auth/widget/userField.dart';
import 'package:camerastore/utils/controllers.dart';
import 'package:flutter/material.dart';
class FormCloumn extends StatelessWidget {
  const FormCloumn({super.key, required this.e});
  final String e;
  @override
  Widget build(BuildContext context) {
    Controllers.userNameController;
    Controllers.emailController;
    Controllers.passwordController;
    Controllers.passwordCheckController;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    print("this e $e");
    return LayoutBuilder(
        builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(
              width: constraints.maxWidth <= 1200? 400: width*.2533333333333333,
              child: UserField(controller: Controllers.userNameController),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: constraints.maxWidth <= 1200? 400: width*.2533333333333333,
              child: EmailField(controller: Controllers.emailController,e:e),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: constraints.maxWidth <= 1200? 400: width*.2533333333333333,
                child: PasswordField(controller: Controllers.passwordController,)
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: constraints.maxWidth <= 1200? 400: width*.2533333333333333,
              child: PasswordCheckField(controller: Controllers.passwordCheckController,),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        );
      }
    );
  }
}
