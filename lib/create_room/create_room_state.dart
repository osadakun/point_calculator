import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_room_state.freezed.dart';
@freezed
class CreateRoomState with _$CreateRoomState {
  const factory CreateRoomState({
    @Default('') String roomName,
    @Default([]) List<Member> members,
  }) = _CreateRoomState;
   const CreateRoomState._(); 

  bool isValidMembers() {
    return members.length >= 3 && members.every((member) => member.name.isNotEmpty);
  }
}

@freezed
class Member with _$Member {
  const factory Member({
    @Default('') String name,
  }) = _Member;
}