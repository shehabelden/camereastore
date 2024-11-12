import 'package:flutter/material.dart';

import '../../../utils/validator.dart';
import '../cubit/cubit.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key,required this.controller, required this.e});
  final TextEditingController controller;
  final String  e;
  @override
  Widget build(BuildContext context) {
    print("this e $e");
    return TextFormField(
      controller: controller,
      validator: (value) {
      return  MainValidator.emailValid(value);
      },
      decoration: InputDecoration(
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
