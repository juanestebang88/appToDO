import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
    super.key,
    required this.emailController,
    required this.icon,
    required this.hintText,
    this.obscure = false,
    this.inputType = TextInputType.text,
    this.validator, 
    this.onChanged,
  });

  final TextEditingController emailController;
  final IconData icon;
  final String hintText;
  final bool obscure;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width* 0.85,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: emailController,
        obscureText: obscure,
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        decoration: _inputDecoration(),
        validator: validator,
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration (
        prefixIcon: Icon(icon),
        prefixIconColor: Colors.deepPurple,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular (10),
          borderSide: const BorderSide (color: Colors.transparent)
        ),
        focusedBorder: OutlineInputBorder (
          borderRadius: BorderRadius.circular (20),
          borderSide: const BorderSide (color: Colors.deepPurple),
        ), // OutlineInputBorder
        fillColor: Colors.grey.shade300,
        focusColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.deepPurple),
      // errorText: 'errorMsg',
      );
  }
}