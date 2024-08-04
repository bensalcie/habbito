import 'package:drift/drift.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/core/common/database/habbits/habbits_table.dart';
import 'package:habbito/core/common/database/common/app_database.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';

import 'package:injectable/injectable.dart';

part 'habbits_dao.g.dart';

/// Create a class to host queries that relate to [AppDatabase] operation on [HabbitsTable].
/// The constructors is called with reference to the [db] to perform operations on.
@lazySingleton
@DriftAccessor(tables: [HabbitsTable])
class HabbitsDao extends DatabaseAccessor<AppDatabase> with _$HabbitsDaoMixin {
  /// [db] database to perform the operations on.
  HabbitsDao(super.db);

  /// Returns the generated id.
  Future<int> addHabbitItem(HabbitsTableCompanion habbit) async {
    return await into(habbitsTable).insert(habbit).onError(
      (error, stackTrace) {
        throw Exception(error.toString());
      },
    );
  }

  /// Updates given Product with Quantity.
  Future updateHabbitItem(HabbitsTableCompanion habbit) async {
    return update(habbitsTable)
      ..where((habbititem) => habbititem.id.equals(habbit.id.value))
      ..write(habbit).onError(
        (error, stackTrace) {
          throw Exception(error.toString());
        },
      );
  }

  /// Fetch all habbits dataname.
  Future<List<HabbitModel>> getHabbitItems() => select(habbitsTable)
      .map((p0) => HabbitModel(
          shouldimprove: p0.shouldimprove ?? true,
          description: p0.description ?? na,
          slug: p0.slug,
          localimage: p0.localimage,
          title: p0.title ?? na,
          id: p0.id))
      .get();

  /// Delete all habbits dataname.
  Future<void> deleteAllHabbitItems() => delete(habbitsTable).go();

  /// Delete a habbit dataname by id.
  Future<int?> deleteHabbitsItem(int id) async {
    return await (delete(habbitsTable)..where((i) => i.id.equals(id)))
        .go()
        .onError((error, stackTrace) => throw Exception(error.toString()));
  }
}
