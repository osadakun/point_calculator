import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:point_calculator/create_room/create_room_state.dart';

part 'enter_room_state.freezed.dart';
@freezed
class EnterRoomState with _$EnterRoomState {
  const factory EnterRoomState({
    @Default([]) List<RoomName> roomNames, 
  }) = _EnterRoomState;

}
@freezed
class RoomName with _$RoomName {
  const factory RoomName({
    @Default('') String name,
    @Default(0) int roomId,
    @Default([]) List<Member> members,
  }) = _RoomName;
}