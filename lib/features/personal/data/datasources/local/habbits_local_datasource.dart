import 'package:drift/drift.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/core/common/database/habbits/habbit_schedule_dao.dart';
import 'package:habbito/core/common/database/habbits/habbits_dao.dart';
import 'package:habbito/core/common/database/common/app_database.dart';
import 'package:habbito/core/common/database/habbits/track_habbit_dao.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:habbito/features/personal/data/models/habbit_schedule_model.dart';
import 'package:habbito/features/personal/data/models/track_habbit_model.dart';
import 'package:injectable/injectable.dart';

abstract class HabbitLocalDataSource {
  /// Call api to Get Home Views
  ///
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<HabbitModel>> getHabbitItems();
  Future<int> addHabbitItem({required HabbitModel params});

  Future<void> updateHabbitItem({required HabbitModel params});

  Future<bool> deleteHabbitItem({required HabbitModel params});
  Future<void> deleteHabbitItems();

// TrackHabbits
  Future<List<TrackHabbitModel>> getTrackHabbitItems();
  Future<int> addTrackHabbitItem({required TrackHabbitModel params});

  Future<void> updateTrackHabbitItem({required TrackHabbitModel params});

  Future<bool> deleteTrackHabbitItem({required TrackHabbitModel params});
  Future<void> deleteTrackHabbitItems();

  // Schedule Habbits.

  Future<List<HabbitScheduleModel>> getScheduleHabbitItems();
  Future<int> addScheduleHabbitItem({required HabbitScheduleModel params});
  Future<void> updateScheduleHabbitItem({required HabbitScheduleModel params});
  Future<bool> deleteScheduleHabbitItem({required HabbitScheduleModel params});
  Future<void> deleteScheduleHabbitItems();
}

@LazySingleton(as: HabbitLocalDataSource)
class HabbitLocalDataSourceImpl implements HabbitLocalDataSource {
  final HabbitsDao _habbitDao;

  final HabbitScheduleDao _habbitScheduleDao;
  final TrackHabbitDao _trackHabbitDao;

  HabbitLocalDataSourceImpl(
      this._habbitDao, this._habbitScheduleDao, this._trackHabbitDao);

  @override
  Future<int> addHabbitItem({required HabbitModel params}) async {
    try {
      return await _habbitDao.addHabbitItem(HabbitsTableCompanion(
        description: Value(params.description),
        title: Value(params.title),
        localimage: Value(params.localimage ?? 'assets/images/rain.jpg'),
        slug: Value(params.slug ?? na),
        shouldimprove: Value(params.shouldimprove),
      ));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteHabbitItem({required HabbitModel params}) async {
    final results = await _habbitDao.deleteHabbitsItem(params.id!);
    return results != null;
  }

  @override
  Future<void> deleteHabbitItems() async {
    final results = await _habbitDao.deleteAllHabbitItems();

    return results;
  }

  @override
  Future<List<HabbitModel>> getHabbitItems() async {
    try {
      final results = await _habbitDao.getHabbitItems();

      return results;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateHabbitItem({required HabbitModel params}) async {
    try {
      return await _habbitDao.updateHabbitItem(HabbitsTableCompanion(
        description: Value(params.description),
        title: Value(params.title),
        localimage: Value(params.localimage ?? 'assets/images/rain.jpg'),
        slug: Value(params.slug ?? na),
        id: Value(params.id!),
        shouldimprove: Value(params.shouldimprove),
      ));
    } catch (e) {
      rethrow;
    }
  }

  //Track Habbit Item.
  @override
  Future<int> addTrackHabbitItem({required TrackHabbitModel params}) async {
    try {
      return await _trackHabbitDao.addTrackHabbitItem(TrackHabbitTableCompanion(
        daysCompleted: Value(params.daysCompleted),
        endDate: Value(params.endDate),
        habbitId: Value(params.habbitId),
        startDate: Value(params.startDate),
      ));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteTrackHabbitItem({required TrackHabbitModel params}) async {
    final results = await _trackHabbitDao.deleteTrackHabbitItem(params.id!);
    return results != null;
  }

  @override
  Future<void> deleteTrackHabbitItems() async {
    final results = await _trackHabbitDao.deleteAllTrackHabbitItems();
    return results;
  }

  @override
  Future<List<TrackHabbitModel>> getTrackHabbitItems() async {
    try {
      final results = await _trackHabbitDao.getTrackHabbitItems();

      return results;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTrackHabbitItem({required TrackHabbitModel params}) async {
    try {
      return await _trackHabbitDao
          .updateTrackHabbitItem(TrackHabbitTableCompanion(
        daysCompleted: Value(params.daysCompleted),
        endDate: Value(params.endDate),
        habbitId: Value(params.habbitId),
        startDate: Value(params.startDate),
      ));
    } catch (e) {
      rethrow;
    }
  }

  //Schdedules
  @override
  Future<int> addScheduleHabbitItem(
      {required HabbitScheduleModel params}) async {
    try {
      return await _habbitScheduleDao
          .addHabbitScheduleItem(HabbitScheduleTableCompanion(
        expectedCompletiondDate: Value(params.expectedCompletiondDate),
        isCompleted: Value(params.isCompleted),
        userComment: Value(params.userComment),
      ));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteScheduleHabbitItem(
      {required HabbitScheduleModel params}) async {
    final results =
        await _habbitScheduleDao.deleteHabbitScheduleItem(params.id!);
    return results != null;
  }

  @override
  Future<void> deleteScheduleHabbitItems() async {
    final results = await _habbitScheduleDao.deleteAllScheduleHabbitItems();
    return results;
  }

  @override
  Future<List<HabbitScheduleModel>> getScheduleHabbitItems() async {
    try {
      final results = await _habbitScheduleDao.getHabbitScheduleItems();

      return results;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateScheduleHabbitItem(
      {required HabbitScheduleModel params}) async {
    try {
      return await _habbitScheduleDao
          .updateHabbitScheduleItem(HabbitScheduleTableCompanion(
        expectedCompletiondDate: Value(params.expectedCompletiondDate),
        isCompleted: Value(params.isCompleted),
        userComment: Value(params.userComment),
      ));
    } catch (e) {
      rethrow;
    }
  }
}
