import 'package:point_calculator/create_room/create_room_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_room_view_model.g.dart';

@riverpod
class CreateRoomViewModel extends _$CreateRoomViewModel {
  @override
  CreateRoomState build() {
    return const CreateRoomState();
  }

  void updateRoomName(String roomName) {
    state = state.copyWith(roomName: roomName);
  }

  void addMember() {
    final updatedMembers = [...state.members, const Member()];
    state = state.copyWith(members: updatedMembers);
  }

  void updateMembers(int index, String value) {
    final updatedList = [...state.members];
    updatedList[index] = updatedList[index].copyWith(name: value);
    state = state.copyWith(members: updatedList);
  }

  void removeMember(int index) {
    final updatedList = [...state.members];
    updatedList.removeAt(index);
    state = state.copyWith(members: updatedList);
  }
}
