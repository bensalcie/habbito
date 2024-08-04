import 'package:drift/drift.dart';

/// [TrackHabbitTable] has TrackHabbit user has Added to Quit/ Improve.
@DataClassName('TrackHabbitDataClass')
class TrackHabbitTable extends Table {
  /// Id of favorited show.
  IntColumn get id => integer().autoIncrement()();
  TextColumn get startDate => text().nullable()();
  TextColumn get endDate => text().nullable()();
  IntColumn get daysCompleted => integer().nullable()();
  IntColumn get habbitId => integer().nullable()();
}
