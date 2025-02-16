import 'package:point_calculator/each_room/each_room_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'each_room_view_model.g.dart';

@riverpod
class EachRoomViewModel extends _$EachRoomViewModel {
  @override
  EachRoom build() {
    return const EachRoom();
  }

  void updateScoreInfo(
      List<Map<String, dynamic>> newTotalData, List<Map<String, dynamic>> newTodayData) {
    // 既存のデータを Map に変換 (member_id をキーにして scores をまとめる)
    Map<int, List<double>> mergedTotalScores = {
      for (var item in state.totalScoreInfo)
        item['member_id'] as int: List<double>.from(item['scores'] as List)
    };
    Map<int, List<double>> mergedTodayScores = {
      for (var item in state.todayScoreInfo)
        item['member_id'] as int: List<double>.from(item['scores'] as List)
    };

    // 新しいデータを統合
    for (var item in newTotalData) {
      int memberId = item['member_id'] as int;
      List<double> scores = List<double>.from(item['scores'] as List);

      // すでにあるデータならスコアを結合
      if (mergedTotalScores.containsKey(memberId)) {
        mergedTotalScores[memberId]!.addAll(scores);
      } else {
        mergedTotalScores[memberId] = scores;
      }
    }

    for (var item in newTodayData) {
      int memberId = item['member_id'] as int;
      List<double> scores = List<double>.from(item['scores'] as List);

      // すでにあるデータならスコアを結合
      if (mergedTodayScores.containsKey(memberId)) {
        mergedTodayScores[memberId]!.addAll(scores);
      } else {
        mergedTodayScores[memberId] = scores;
      }
    }

    // Map を List<Map<String, dynamic>> に戻す
    List<Map<String, dynamic>> updatedTotalScoreInfo = mergedTotalScores.entries.map((e) {
      return {"member_id": e.key, "scores": e.value};
    }).toList();
    List<Map<String, dynamic>> updatedTodayScoreInfo = mergedTodayScores.entries.map((e) {
      return {"member_id": e.key, "scores": e.value};
    }).toList();

    state = state.copyWith(
      totalScoreInfo: updatedTotalScoreInfo,
      todayScoreInfo: updatedTodayScoreInfo,
      isInitial: false,
      createdAt: newTotalData.first["created_at"],
    );
  }

  void updateIsLoad() {
    state = state.copyWith(
      isLoad: !state.isLoad
    );
  }
}