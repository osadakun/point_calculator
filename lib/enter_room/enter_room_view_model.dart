import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'enter_room_state.dart';

part 'enter_room_view_model.g.dart';

@riverpod
class EnterRoomViewModel extends _$EnterRoomViewModel {
  @override
  EnterRoomState build() {
    return const EnterRoomState();
  }

  void updateRoomName(List<RoomName> list) {
    state = state.copyWith(roomNames: list);
  }
}
