import 'package:drift/drift.dart';
import 'package:habbito/core/common/database/common/app_database.dart';
import 'package:habbito/core/common/database/habbits/habbit_schedule_table.dart';
import 'package:habbito/features/personal/data/models/habbit_schedule_model.dart';

import 'package:injectable/injectable.dart';

part 'habbit_schedule_dao.g.dart';

/// Create a class to host queries that relate to [AppDatabase] operation on [HabbitScheduleTable].
/// The constructors is called with reference to the [db] to perform operations on.
@lazySingleton
@DriftAccessor(tables: [HabbitScheduleTable])
class HabbitScheduleDao extends DatabaseAccessor<AppDatabase>
    with _$HabbitScheduleDaoMixin {
  /// [db] database to perform the operations on.
  HabbitScheduleDao(super.db);

  /// Returns the generated id.
  Future<int> addHabbitScheduleItem(HabbitScheduleTableCompanion habbit) async {
    return await into(habbitScheduleTable).insert(habbit).onError(
      (error, stackTrace) {
        throw Exception(error.toString());
      },
    );
  }

  /// Updates given Product with Quantity.
  Future updateHabbitScheduleItem(HabbitScheduleTableCompanion habbit) async {
    return update(habbitScheduleTable)
      ..where((habbititem) => habbititem.id.equals(habbit.id.value))
      ..write(habbit).onError(
        (error, stackTrace) {
          throw Exception(error.toString());
        },
      );
  }

  /// Fetch all habbits dataname.
  Future<List<HabbitScheduleModel>> getHabbitScheduleItems() =>
      select(habbitScheduleTable)
          .map((p0) => HabbitScheduleModel(
              expectedCompletiondDate: p0.expectedCompletiondDate,
              isCompleted: p0.isCompleted,
              userComment: p0.userComment))
          .get();

  /// Delete all habbits dataname.
  Future<void> deleteAllScheduleHabbitItems() =>
      delete(habbitScheduleTable).go();

  /// Delete a habbit dataname by id.
  Future<int?> deleteHabbitScheduleItem(int id) async {
    return await (delete(habbitScheduleTable)..where((i) => i.id.equals(id)))
        .go()
        .onError((error, stackTrace) => throw Exception(error.toString()));
  }
}
