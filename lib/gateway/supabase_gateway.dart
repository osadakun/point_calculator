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
          .insert({
            'room_name': roomName,
          })
          .select('id')
          .single();
      return Success(response['id'] as int);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<Result<void>> addMemberToRoom(int roomId, List<Member> members) async {
  try {
    final futures = members.map((member) {
      return supabaseClient.from('room_members').insert({
        'room_id': roomId,
        'member_id': member.id,
      });
    }).toList();

    await Future.wait(futures);

    return const Success(null);
  } catch (e) {
    return Failure(Exception(e.toString()));
  }
}

  Future<Result<void>> createRoomWithMembers(
      String roomName, List<Member> members) async {
    final roomId = await createRoom(roomName);
    final result = await roomId.map(
      success: (id) => addMemberToRoom(id, members),
      failure: (error) => Future.value(Failure(error)),
    );
    return result;
  }

  Future<Result<Map<String, List<String>>>> fetchRoomInformations() async {
  try {
    final rooms = await supabaseClient.from('rooms').select('id, room_name');

    final roomIds = rooms.map((e) => e['id'] as int).toList();
    if (roomIds.isEmpty) return const Success({});
    // 各部屋に所属するメンバーIDを取得
    final roomMembers = await supabaseClient
        .from('room_members')
        .select('room_id, member_id')
        .eq('room_id', roomIds);

    // member_id のリストを作成
    final memberIds = roomMembers.map((e) => e['member_id'] as int).toSet().toList();
    if (memberIds.isEmpty) return const Success({}); // メンバーがいなければ空のマップを返す

    // メンバーの名前を取得
    final members = await supabaseClient
        .from('members')
        .select('id, name')
        .eq('id', memberIds);

    // メンバーIDと名前のマッピングを作成
    final memberMap = {for (var m in members) m['id'] as int: m['name'] as String};

    // 部屋ごとにメンバーの名前をまとめる
    final Map<String, List<String>> roomInfo = {};
    for (var room in rooms) {
      final roomId = room['id'] as int;
      final roomName = room['room_name'] as String;

      // この部屋に所属するメンバーの名前を取得
      final memberNames = roomMembers
          .where((rm) => rm['room_id'] == roomId)
          .map((rm) => memberMap[rm['member_id']] ?? 'Unknown') // 名前がない場合 'Unknown'
          .toList();

      roomInfo[roomName] = memberNames;
    }

    return Success(roomInfo);
  } catch (e) {
    return Failure(Exception(e.toString()));
  }
}


  Future<Result<List>> fetchRoomMembers(int roomId) async {
    try {
      final memberIds = await supabaseClient
          .from('room_members')
          .select('member_id')
          .eq('room_id', roomId);
      final response = await supabaseClient
          .from('members')
          .select('name')
          .eq('id', memberIds.map((e) => e['member_id'] as int).toList());
      return Success(response);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<Result<List>> fetchAllMembers() async {
    try {
      final response = await supabaseClient.from('members').select();
      return Success(response);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<Result<void>> addMember(String name) async {
    try {
      await supabaseClient.from('members').insert({
        'name': name,
      });
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
