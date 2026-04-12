import 'package:flutter/material.dart';
import 'package:tela_aplicacao/core/constants/app_color.dart';
import 'package:tela_aplicacao/core/constants/app_dimensions.dart';
import 'package:tela_aplicacao/core/constants/app_strings.dart';
import 'package:tela_aplicacao/core/utils/validator.dart';
import 'package:tela_aplicacao/presentation/pages/auth/login/controller/login_controller.dart';
import 'package:tela_aplicacao/presentation/widgets/buttons/custom_eleveted_button.dart';
import 'package:tela_aplicacao/presentation/widgets/buttons/custom_text_button.dart';
import 'package:tela_aplicacao/presentation/widgets/inputs/custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onLogin;
  final VoidCallback onRegister;

  const LoginForm({super.key, required this.onLogin, required this.onRegister});

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _controller = LoginController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (_controller.formKey.currentState!.validate()) {
      widget.onLogin;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                key: _controller.formKey,
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
                      controller: _controller.emailController,
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
                      controller: _controller.passwordController,
                      labelText: AppStrings.password,
                      hintText: AppStrings.enterPassword,
                      obscureText: _controller.obscurePassword,
                      prefixIcon: const Icon(Icons.lock_outlined),
                      textInputAction: TextInputAction.done,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _controller.toggleObscurePassword();
                          });
                        },
                        icon: Icon(
                          _controller.obscurePassword
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
                        onPressed: _submit,
                        text: AppStrings.login,
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    CustomTextButton(
                      onPressed: widget.onRegister,
                      text: AppStrings.forgotPasswordLink,
                    ),
                  ],
                ),
              ),
    );
  }
}
