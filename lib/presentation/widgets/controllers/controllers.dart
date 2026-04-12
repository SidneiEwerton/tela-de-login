import 'package:flutter/material.dart';

class Controllers {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
 
  bool obscurePassword = true;



  
  void dispose(){
  
  emailController.dispose();
  passwordController.dispose();
  nameController.dispose();
  confirmPasswordController.dispose();
  
  

  }
}