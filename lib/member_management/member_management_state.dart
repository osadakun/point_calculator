import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:point_calculator/create_room/create_room_state.dart';

part 'member_management_state.freezed.dart';

@freezed
class MemberManagementState with _$MemberManagementState {
  const factory MemberManagementState({
    @Default([]) List<Member> members,
  }) = _MemberManagementState;
}