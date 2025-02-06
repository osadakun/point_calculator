import 'package:point_calculator/each_room/each_room_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'each_room_view_model.g.dart';

@riverpod
class EachRoomViewModel extends _$EachRoomViewModel {
  @override
  EachRoom build() {
    return const EachRoom();
  }

  // 更新したいstateを引数に取るメソッドを作成
  void updateScoreInfo(List<Map<String, dynamic>> data) {
    state = state.copyWith(
      scoreInfo: data
    );
  }
}