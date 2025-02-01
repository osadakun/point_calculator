import 'package:point_calculator/create_room/create_room_state.dart';
import 'package:point_calculator/member_management/member_management_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_management_view_model.g.dart';

@riverpod
class MemberManagementViewModel extends _$MemberManagementViewModel {
  @override
  MemberManagementState build() {
    return const MemberManagementState();
  }

  void updateMembers(List<Member> list) {
    state = state.copyWith(members: list);
  }
}