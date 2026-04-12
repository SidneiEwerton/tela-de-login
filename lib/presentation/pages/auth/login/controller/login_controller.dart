import 'package:flutter/material.dart';

class LoginController {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;

void toggleObscurePassword(){
  obscurePassword = !obscurePassword;
}

  
  void dispose(){
  
  emailController.dispose();
  passwordController.dispose();

  /* baseado na loginpage reafatore a registerpage

  estudar sobre pacote drift no flutter
  build runner  

  */
  
  
  

  }
}