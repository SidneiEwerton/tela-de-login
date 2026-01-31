import 'package:flutter/material.dart';
import 'package:tela_aplicacao/presentation/widgets/buttons/custom_eleveted_button.dart';
import 'package:tela_aplicacao/presentation/widgets/buttons/custom_text_button.dart';
import 'package:tela_aplicacao/presentation/widgets/inputs/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formalKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /*
globalKey
controller email e password
obscure password
dispose

dispose, globalkey e texteditcontrolller ( estudar )
FormState


  */

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
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Form(
                key: _formalKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.lock_clock_outlined,
                      size: 80,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Bem vindo',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Faça login para continuar',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 32,),
                    CustomTextFormField(
                      
                      controller: _emailController,
                      labelText: 'E-mail',
                      hintText: 'Digite o seu E-mail',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email_outlined),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty){

                          return 'Por favor digite o seu E-mail';

        
                        }
                        if ( !value.contains('@')  ){
                          return 'Digite um E-mail valido';
                        }
                        return null;
                        

                        
                      },
                    ),
                    SizedBox(height: 16,),
                    CustomTextFormField(
                      controller: _passwordController,
                      labelText: 'Digite a sua senha',
                      obscureText: _obscurePassword,
                      prefixIcon: Icon(Icons.lock_clock_outlined),
                    ),
                    SizedBox(height: 24,),
                    

                    CustomElevatedButton(onPressed: (
                      
                    ){
                      
                    }, text:  'Entrar',
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        
                        
                      ),
                      
                    ),
                    
                    
                    ),
                     
                     
                  
                    SizedBox(height: 16,),
                    CustomTextButton(onPressed: () {}, text: 'Esqueceu a senha? clique aqui')
                    
                      
                    

                    
                
                    

                    /*
                    criar um custom text formfield da senha 
                    sizedbox 24 
                    sizedbox 50, customeleventedbutton (com um texto entrar)
                    sizedbox 16
                    customtextbutton (texto esqueceu a senha ? clique aqui )



                    */

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
