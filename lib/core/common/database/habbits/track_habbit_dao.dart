import 'package:drift/drift.dart';
import 'package:habbito/core/common/database/common/app_database.dart';
import 'package:habbito/core/common/database/habbits/track_habbit_table.dart';
import 'package:habbito/features/personal/data/models/track_habbit_model.dart';

import 'package:injectable/injectable.dart';

part 'track_habbit_dao.g.dart';

/// Create a class to host queries that relate to [AppDatabase] operation on [TrackHabbitTable].
/// The constructors is called with reference to the [db] to perform operations on.
@lazySingleton
@DriftAccessor(tables: [TrackHabbitTable])
class TrackHabbitDao extends DatabaseAccessor<AppDatabase>
    with _$TrackHabbitDaoMixin {
  /// [db] database to perform the operations on.
  TrackHabbitDao(super.db);

  /// Returns the generated id.
  Future<int> addTrackHabbitItem(TrackHabbitTableCompanion habbit) async {
    return await into(trackHabbitTable).insert(habbit).onError(
      (error, stackTrace) {
        throw Exception(error.toString());
      },
    );
  }

  /// Updates given Product with Quantity.
  Future updateTrackHabbitItem(TrackHabbitTableCompanion habbit) async {
    return update(trackHabbitTable)
      ..where((habbititem) => habbititem.id.equals(habbit.id.value))
      ..write(habbit).onError(
        (error, stackTrace) {
          throw Exception(error.toString());
        },
      );
  }

  /// Fetch all habbits dataname.
  Future<List<TrackHabbitModel>> getTrackHabbitItems() =>
      select(trackHabbitTable)
          .map((p0) => TrackHabbitModel(
                daysCompleted: p0.daysCompleted,
                endDate: p0.endDate,
                habbitId: p0.id,
                startDate: p0.startDate,
              ))
          .get();

  ///Fetch Track Habbit item.
  ///
  Future getTrackHabbitItemByHabbitId(int habbitId) async {
    return select(trackHabbitTable)
      ..where((habbititem) => habbititem.habbitId.equals(habbitId))
      ..get().onError(
        (error, stackTrace) {
          throw Exception(error.toString());
        },
      );
  }

  /// Delete all habbits dataname.
  Future<void> deleteAllTrackHabbitItems() => delete(trackHabbitTable).go();

  /// Delete a habbit dataname by id.
  Future<int?> deleteTrackHabbitItem(int id) async {
    return await (delete(trackHabbitTable)..where((i) => i.id.equals(id)))
        .go()
        .onError((error, stackTrace) => throw Exception(error.toString()));
  }
}
