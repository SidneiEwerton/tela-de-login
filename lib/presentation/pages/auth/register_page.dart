import 'package:flutter/material.dart';
import 'package:tela_aplicacao/core/constants/app_color.dart';
import 'package:tela_aplicacao/core/constants/app_dimensions.dart';
import 'package:tela_aplicacao/core/constants/app_strings.dart';
import 'package:tela_aplicacao/core/utils/validator.dart';
import 'package:tela_aplicacao/presentation/pages/auth/login/login_page.dart';
import 'package:tela_aplicacao/presentation/widgets/buttons/custom_eleveted_button.dart';
import 'package:tela_aplicacao/presentation/widgets/buttons/custom_text_button.dart';
import 'package:tela_aplicacao/presentation/widgets/controllers/controllers.dart';
import 'package:tela_aplicacao/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
final Controllers _controllers = Controllers();

  @override
 void dispose(){
  _controllers.dispose();
  super.dispose();
 }
 

  void _register(){
    if(_controllers.formKey.currentState!.validate());

  }

  void _gotologin (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Register'),),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundLogin.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(23),
            child: Container(
              padding: EdgeInsets.all(23),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppDimensions.marginXL),
              ),
              child: Form(
                key: _controllers.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.person_add,
                      size: 50,
                      color: AppColors.primary,
                    ),
                    SizedBox(
                      height: 18,
                    ),

                    CustomTextFormField(
                      labelText: AppStrings.name,
                      hintText: AppStrings.enterName,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.account_circle_outlined),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    CustomTextFormField(
                      controller: _controllers.emailController,
                      labelText: AppStrings.email,
                      hintText: AppStrings.enterEmail,
                      prefixIcon: Icon(Icons.email_outlined),
                      textInputAction: TextInputAction.next,
                      validator: Validators.email,
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    CustomTextFormField(
                      controller: _controllers.passwordController,
                      obscureText: _controllers.obscurePassword,
                      labelText: AppStrings.password,
                      hintText: AppStrings.enterPassword,
                      prefixIcon: Icon(Icons.lock_outline_rounded),

                      textInputAction: TextInputAction.done,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _controllers.obscurePassword = !_controllers.obscurePassword;
                          });
                        },
                        icon: Icon(
                          _controllers.obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: Validators.password,
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    CustomTextFormField(
                      controller: _controllers.confirmPasswordController,
                      obscureText: _controllers.obscurePassword,
                      labelText: AppStrings.confirmPassword,
                      hintText: AppStrings.confirmPassword,
                      prefixIcon: Icon(Icons.lock_outline_rounded),

                      textInputAction: TextInputAction.done,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _controllers.obscurePassword = !_controllers.obscurePassword;
                          });
                        },
                        icon: Icon(
                          _controllers.obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (value) => Validators.confirmPassword(
                        value,
                        _controllers.passwordController.text
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    CustomElevatedButton(    
                      onPressed: 
                        _register,     
                      text: AppStrings.register,
                      
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    CustomTextButton(
                      onPressed: _gotologin, 
                     text: AppStrings.alreadyHaveAccount,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/*
baseado como na homepage faça a registerpage
*alem de email e senha , campo nome , confirmar senha 
texto para voltar na login page 
dois metofos  , void register , metodo gotologin(dentro do customtextbuttom)
e o register dentro do customelevetedbuttom
obscure confirme password



*/
