import 'package:tela_aplicacao/data/database/daos/category_dao.dart';
import 'package:tela_aplicacao/data/database/model/category_model.dart';
import 'package:tela_aplicacao/data/repositories/category_repository.dart';
import 'package:tela_aplicacao/domain/entities/category_entity.dart';

class CategoryRepositorImpl implements CategoryRepository{

final CategoryDao _categoryDao;

const CategoryRepositorImpl (this._categoryDao);

  @override
  Future<List<CategoryEntity>> getAll() async {
   final results = await _categoryDao.getAll();
   return results.map((data) => CategoryModel.fromDrift(data).toEntity()).toList();
  }

  @override
  Stream<List<CategoryEntity>> watchAll() => _categoryDao.watchAll().map(
    (list) => list.map((data) => CategoryModel.fromDrift(data).toEntity()).toList(),
  );
     // estudar sobre Stream

  @override
  Future<CategoryEntity?> getById(String id) async {
    final data = await _categoryDao.getById(id);
    if (data == null) return null;
    return CategoryModel.fromDrift(data).toEntity();
  }

  
  @override
  Future<void> insert(CategoryEntity category) async{
    final model = CategoryModel.fromEntity(category);
    await _categoryDao.insertCategory(model.toCompanion());
  
  }
    
  @override
  Future<void> delete(String id) => _categoryDao.deleteCategory(id);

  @override
  Future<void> update(CategoryEntity category) async {

    final model = CategoryModel.fromEntity(category);
    await _categoryDao.updateCategory(model.toCompanion());
  
  }

  
}