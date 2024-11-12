import 'package:flutter/material.dart';

import '../../../utils/validator.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key,required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return MainValidator.password(value);
      },
      decoration: InputDecoration(
        hintText: "password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
