import 'package:drift/drift.dart';
import 'package:tela_aplicacao/data/database/app_database.dart';
import 'package:tela_aplicacao/data/database/tables/categories_table.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [CategoriesTable])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.db);

  Future<List<CategoriesTableData>> getAll() => select(categoriesTable).get();

  Stream<List<CategoriesTableData>> watchAll() =>
      select(categoriesTable).watch();

  Future<CategoriesTableData?> getById(String id) =>
      (select(categoriesTable)..where((c) => c.id.equals(id)))
          .getSingleOrNull();

  Future<int> insertCategory(CategoriesTableCompanion category) =>
      into(categoriesTable).insert(category);

  Future<bool> updateCategory(CategoriesTableCompanion category) =>
      update(categoriesTable).replace(category);

  Future<int> deleteCategory(String id) =>
      (delete(categoriesTable)..where((c) => c.id.equals(id))).go();

  watchById(String id) {}
}