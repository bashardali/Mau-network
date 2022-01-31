import 'package:mau/service/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class FormPassTextField extends StatelessWidget {
  final TextEditingController passwordController;
  FormPassTextField(this.passwordController);
  @override
  Widget build(BuildContext context) {
    final pr = context.watch<DesignProvider>();
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: [AutofillHints.password],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        } else if (value.length < 5) {
          return 'your password is incomplete';
        }
        return null;
      },
      autofocus: false,
      obscureText: pr.obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () => pr.suffixIconProcess(),
          icon: Icon(
            Icons.remove_red_eye_sharp,
            color: pr.suffixColor,
          ),
        ),
        labelText: "Password",
        labelStyle: TextStyle(fontSize: 17, color: Colors.amber),
        errorStyle: TextStyle(color: Colors.black26),
      ),
    );
  }
}