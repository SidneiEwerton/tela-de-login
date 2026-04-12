import 'package:flutter/material.dart';
import 'package:tela_aplicacao/app.dart';
import 'package:intl/date_symbol_data_local.dart';



void main() async {

    WidgetsFlutterBinding.ensureInitialized();
  
 
  await initializeDateFormatting('pt_BR', null); 
  runApp(const App());
}

