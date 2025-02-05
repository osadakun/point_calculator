import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:point_calculator/create_room/create_room_state.dart';
import 'package:point_calculator/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_gateway.g.dart';

@Riverpod(keepAlive: true)
SupabaseClient supabase(Ref ref) {
  return Supabase.instance.client;
}

@Riverpod(keepAlive: true)
class SupabaseGateway extends _$SupabaseGateway {
  late final SupabaseClient supabaseClient;

  @override
  void build() {
    supabaseClient = ref.read(supabaseProvider);
  }

  Future<Result<int>> createRoom(String roomName) async {
    try {
      final response = await supabaseClient
          .from('rooms')
          .insert({'room_name': roomName})
          .select('id')
          .single();
      return Success(response['id'] as int);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<Result<void>> addMemberToRoom(int roomId, List<Member> members) async {
    try {
      final data = members
          .map((member) => {
                'room_id': roomId,
                'member_id': member.id,
              })
          .toList();

      await supabaseClient.from('room_members').insert(data);
      return const Success(null);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<Result<void>> createRoomWithMembers(
      String roomName, List<Member> members) async {
    final roomId = await createRoom(roomName);
    return roomId.map(
      success: (id) => addMemberToRoom(id, members),
      failure: (error) => Future.value(Failure(error)),
    );
  }

  /// **部屋情報を取得（部屋名ごとのメンバー一覧）**
  /// **部屋情報を取得（部屋ID, 部屋名ごとのメンバー一覧）**
  Future<Result<Map<int, Map<String, List<String>>>>>
      fetchRoomInformations() async {
    try {
      final response = await supabaseClient
          .from('room_members')
          .select('room_id, rooms!inner(room_name), members!inner(name)')
          .order('room_id', ascending: true);

      final Map<int, Map<String, List<String>>> roomInfo = {};

      for (var item in response) {
        final roomId = item['room_id'] as int;
        final roomName = item['rooms']['room_name'] as String;
        final memberName = item['members']['name'] as String;

        roomInfo.putIfAbsent(roomId, () => {roomName: []});
        roomInfo[roomId]![roomName]!.add(memberName);
      }

      return Success(roomInfo);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  /// **特定の部屋にいるメンバー一覧**
  Future<Result<List<String>>> fetchRoomMembers(int roomId) async {
    try {
      final response = await supabaseClient
          .from('room_members')
          .select('members!inner(name)')
          .eq('room_id', roomId);

      final memberNames =
          response.map((e) => e['members']['name'] as String).toList();
      return Success(memberNames);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  /// **全メンバー一覧**
  Future<Result<Map<int, String>>> fetchAllMembers() async {
    try {
      final response = await supabaseClient.from('members').select('id, name');
      final Map<int, String> members = {
        for (var item in response) item['id'] as int: item['name'] as String
      };

      return Success(members);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<Result<void>> addMember(String name) async {
    try {
      await supabaseClient.from('members').insert({'name': name});
      return const Success(null);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<Result<void>> deleteMember(int id) async {
    try {
      await supabaseClient.from('members').delete().eq('id', id);
      return const Success(null);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }
}
