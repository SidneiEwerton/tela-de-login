import 'package:tela_aplicacao/data/database/daos/user_dao.dart';
import 'package:tela_aplicacao/data/database/model/user_model.dart';
import 'package:tela_aplicacao/data/repositories/user_repository.dart';
import 'package:tela_aplicacao/domain/entities/user_entity.dart';

class UserRepositoryImpl implements UserRepository{
 final UserDao _userDao;

 const UserRepositoryImpl (this._userDao);

  @override
  Future<void> delete(String id) => _userDao.deleteUser(id); 
    
  

  @override
  Future<List<UserEntity>> getAll() async {
    final results = await _userDao.getAll();
    return results.map((data) => UserModel.fromDrift(data).toEntity()).toList();  
  }

  @override
  Future<UserEntity?> getByEmail(String email) async {
    final data = await _userDao.getByEmail(email);
    if(data == null )return null;
    return UserModel.fromDrift(data).toEntity();
    
  }

  @override
  Future<UserEntity?> getById(String id) async {
    final data = await _userDao.getById(id);
    if(data == null) return null;
    return UserModel.fromDrift(data).toEntity(); 
  }
  
  @override
  Future<void> insert(UserEntity user, String passwordHash) async{
    final model =  UserModel.fromEntity(user, passwordHash:passwordHash );
    await _userDao.insertUser(model.toCompanion());
    
  }
  
  @override
  Future<void> update(UserEntity user, String passwordHash) async{
    final model = UserModel.fromEntity(user, passwordHash: passwordHash);
    await _userDao.updateUser(model.toCompanion());  
  }
  
  @override
  Future<bool> verifyPassword(String email, String passwordHash) async {
    final data = await _userDao.getByEmail(email);
    if(data == null) return false;
    return data.passwordHash == passwordHash;  
    // pesquisar sobre segurança de mais de um email 

  } 
}