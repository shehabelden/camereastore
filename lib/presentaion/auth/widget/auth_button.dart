import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return  Container(
      height: height*.0616438356164384,
      width: width*.2666666666666667,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFFFF5900),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        "Create Account",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

  }
}
