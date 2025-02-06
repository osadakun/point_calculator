import 'package:point_calculator/create_room/create_room_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'enter_room_state.dart';

part 'enter_room_view_model.g.dart';

@Riverpod(keepAlive: true)
class EnterRoomViewModel extends _$EnterRoomViewModel {
  @override
  EnterRoomState build() {
    return const EnterRoomState();
  }

  void updateRoomName(List<RoomName> list) {
    state = state.copyWith(roomNames: list);
  }

  void updateRoomMembers(List<Member> list) {
    state = state.copyWith(roomNames: state.roomNames.map((e) => e.copyWith(members: list)).toList());
  }
}
