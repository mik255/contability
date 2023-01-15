import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String? hintText;
  final String Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChange;
  final bool isPassword;
  final bool isEmail;

  const CustomFormField({
     super.key,
     this.hintText,
     this.validator,
     this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChange,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}