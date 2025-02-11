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
      List<Map<String, dynamic>> newData) {
    // 既存のデータを Map に変換 (member_id をキーにして scores をまとめる)
    Map<int, List<double>> mergedScores = {
      for (var item in state.scoreInfo)
        item['member_id'] as int: List<double>.from(item['scores'] as List)
    };

    // 新しいデータを統合
    for (var item in newData) {
      int memberId = item['member_id'] as int;
      List<double> scores = List<double>.from(item['scores'] as List);

      // すでにあるデータならスコアを結合
      if (mergedScores.containsKey(memberId)) {
        mergedScores[memberId]!.addAll(scores);
      } else {
        mergedScores[memberId] = scores;
      }
    }

    // Map を List<Map<String, dynamic>> に戻す
    List<Map<String, dynamic>> updatedScoreInfo = mergedScores.entries.map((e) {
      return {"member_id": e.key, "scores": e.value};
    }).toList();

    state = state.copyWith(
      scoreInfo: updatedScoreInfo,
      isInitial: false
      // createdAt: createdAt,
    );
  }

  void updateIsLoad() {
    state = state.copyWith(
      isLoad: !state.isLoad
    );
  }
}