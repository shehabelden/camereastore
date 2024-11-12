import 'package:flutter/material.dart';

import '../../../utils/validator.dart';

class UserField extends StatelessWidget {
  const UserField({super.key,required this.controller});
   final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return MainValidator.usernameValid(value!);
      },
      decoration: InputDecoration(
        hintText: "username",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
