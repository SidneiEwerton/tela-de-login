// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dao.dart';

// ignore_for_file: type=lint
mixin _$TodoDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoriesTableTable get categoriesTable => attachedDatabase.categoriesTable;
  $TodosTableTable get todosTable => attachedDatabase.todosTable;
  TodoDaoManager get managers => TodoDaoManager(this);
}

class TodoDaoManager {
  final _$TodoDaoMixin _db;
  TodoDaoManager(this._db);
  $$CategoriesTableTableTableManager get categoriesTable =>
      $$CategoriesTableTableTableManager(
        _db.attachedDatabase,
        _db.categoriesTable,
      );
  $$TodosTableTableTableManager get todosTable =>
      $$TodosTableTableTableManager(_db.attachedDatabase, _db.todosTable);
}
