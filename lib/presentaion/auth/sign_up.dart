import 'package:beamer/beamer.dart';
import 'package:camerastore/presentaion/auth/login.dart';
import 'package:camerastore/presentaion/auth/widget/Form_Cloumn.dart';
import 'package:camerastore/presentaion/auth/widget/auth_button.dart';
import 'package:camerastore/presentaion/auth/widget/header.dart';
import 'package:camerastore/utils/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Controllers.userNameController;
    Controllers.emailController;
    Controllers.passwordController;
    Controllers.passwordCheckController;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    LoginCubit cubit = LoginCubit.get(context);
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset(
              "images/بروفايل سوشيال شكل 2.png",
              height: 120,
              width: 120,
            ),
            actions: [
              Text("have an account?"),
              InkWell(
                onTap: () {
                  context.beamToNamed('/login');
                },
                child: const Text(
                  "  Sign in!",
                  style: TextStyle(
                    color: Color(0xFFFF5900),
                  ),
                ),
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: constraints.maxWidth <= 600 ? 100 : 100),
                    child: const Header(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: constraints.maxWidth <= 600 ? 100 : 50),
                    child: const Text("Or continue with"),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0, left: 50),
                    child: Form(
                      key: _formKey,
                      child: FormCloumn(e: cubit.emailExption),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 00.0),
                    child: InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.SignupWithEmailandpass(
                                Controllers.emailController.text,
                                Controllers.passwordController.text,
                                Controllers.userNameController.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('account is creating'),
                                action: SnackBarAction(
                                  label: '',
                                  onPressed: () {
                                    // Code to execute.
                                  },
                                ),
                              ),
                            );
                          }
                        },
                        child: const AuthButton()),
                  )
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
