import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:point_calculator/create_room/create_room_state.dart';

part 'each_room_state.freezed.dart';
@freezed
class EachRoom with _$EachRoom {
  const factory EachRoom({
    @Default('') String roomName,
    @Default(0) int roomId,
    @Default([]) List<Member> roomMembers,
    @Default(0) int basePoint,
  }) = _EachRoom;
}