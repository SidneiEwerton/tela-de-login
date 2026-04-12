import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tela_aplicacao/data/database/app_database.dart';
part 'database_provider.g.dart';


@Riverpod(KeepAlive: true)
AppDatabase appDatabase(Ref ref){
  final db = AppDatabase();
  ref 
}