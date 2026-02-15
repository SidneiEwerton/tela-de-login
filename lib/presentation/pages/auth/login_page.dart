import 'package:flutter/material.dart';
import 'package:tela_aplicacao/core/constants/app_color.dart';
import 'package:tela_aplicacao/core/constants/app_dimensions.dart';
import 'package:tela_aplicacao/core/constants/app_strings.dart';
import 'package:tela_aplicacao/core/utils/validator.dart';
import 'package:tela_aplicacao/presentation/pages/auth/register_page.dart';
import 'package:tela_aplicacao/presentation/pages/home/home_page.dart';
import 'package:tela_aplicacao/presentation/widgets/buttons/custom_eleveted_button.dart';
import 'package:tela_aplicacao/presentation/widgets/buttons/custom_text_button.dart';
import 'package:tela_aplicacao/presentation/widgets/inputs/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  void _register() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundLogin.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.cardShadow,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.lock_clock_outlined,
                      size: 80,
                      color: AppColors.primary,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      AppStrings.welcome,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textTitle,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      AppStrings.loginToContinue,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textSubtitle,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    CustomTextFormField(
                      controller: _emailController,
                      labelText: AppStrings.email,
                      hintText: AppStrings.enterEmail,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email_outlined),
                      textInputAction: TextInputAction.next,
                      validator: Validators.email,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      labelText: AppStrings.password,
                      hintText: AppStrings.enterPassword,
                      obscureText: _obscurePassword,
                      prefixIcon: const Icon(Icons.lock_outlined),
                      textInputAction: TextInputAction.done,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: Validators.password,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CustomElevatedButton(
                        onPressed: _login,
                        text: AppStrings.login,
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    CustomTextButton(
                      onPressed: _register,
                      text: AppStrings.forgotPasswordLink,
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
