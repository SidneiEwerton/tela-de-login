import 'package:flutter/material.dart';
import 'package:tela_aplicacao/presentation/pages/auth/login/widgets/login_form.dart';
import 'package:tela_aplicacao/presentation/pages/auth/register_page.dart';
import 'package:tela_aplicacao/presentation/pages/home/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _login(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void _register(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
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
            child: LoginForm(
              onLogin: () => _login(context),
              onRegister: () => _register(context),
            ),
          ),
        ),
      ),
    );
  }
}
