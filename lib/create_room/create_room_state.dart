import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_room_state.freezed.dart';

@freezed
class CreateRoomState with _$CreateRoomState {
  const factory CreateRoomState({
    @Default('') String roomName,
    @Default([]) List<Member> members,
  }) = _CreateRoomState;
}

@freezed
class Member with _$Member {
  const factory Member({
    @Default('') String name,
    @Default(0) int id,
  }) = _Member;
}
