import 'package:flutter/material.dart';

import '../../../utils/validator.dart';

class PasswordCheckField extends StatelessWidget {
  const PasswordCheckField({super.key,required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return MainValidator.password(value);
      },
      decoration: InputDecoration(
        hintText: "password check",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
