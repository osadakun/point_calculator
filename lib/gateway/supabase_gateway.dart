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

  /// **部屋を作成**
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

  /// **部屋にメンバーを追加**
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

  /// **部屋を作成してメンバーを追加**
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
  Future<Result<Map<int, Map<String, List<Member>>>>>
      fetchRoomInformations() async {
    try {
      final response = await supabaseClient
          .from('room_members')
          .select('room_id, rooms!inner(room_name), members!inner(name, id)')
          .order('room_id', ascending: true);

      final Map<int, Map<String, List<Member>>> roomInfo = {};

      for (var item in response) {
        final roomId = item['room_id'] as int;
        final roomName = item['rooms']['room_name'] as String;
        final member = Member(
          name: item['members']['name'] as String,
          id: item['members']['id'] as int,
        );

        roomInfo.putIfAbsent(roomId, () => {roomName: []});
        roomInfo[roomId]![roomName]!.add(member);
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

  /// **メンバーを追加**
  Future<Result<void>> addMember(String name) async {
    try {
      await supabaseClient.from('members').insert({'name': name});
      return const Success(null);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  /// **メンバーを削除**
  Future<Result<void>> deleteMember(int id) async {
    try {
      await supabaseClient.from('members').delete().eq('id', id);
      return const Success(null);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  /// **部屋のルールを決定する**
  Future<Result<void>> setRoomRule(int roomId, String basePoint) async {
    try {
      final point = int.tryParse(basePoint) ?? 25000;
      await supabaseClient.from('rules').upsert(
          {'room_id': roomId, 'base_point': point},
          onConflict: 'room_id');
      return const Success(null);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  /// **部屋のルールを取得**
  Future<Result<int>> fetchRoomRule(int roomId) async {
    try {
      final response = await supabaseClient
          .from('rules')
          .select('base_point')
          .eq('room_id', roomId)
          .single();

      return Success(response['base_point'] as int);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  /// 得点結果の保存
  Future<Result<void>> storeResults(
      List<Map<String, num>> list, int roomId) async {
    try {
      await Future.wait(list.map((e) async {
        await supabaseClient.from('game_scores').insert({
          'member_id': e["member_id"],
          'scores': e["score"],
          'room_id': roomId,
        });
      }));
      return const Success(null);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<Result<List<Map<String, dynamic>>>> fetchTotalResults(
      int roomId, bool isInitial, int limit) async {
    try {
      final response = isInitial
          ? await supabaseClient
              .from('game_scores')
              .select('member_id, scores, created_at')
              .eq('room_id', roomId)
          : await supabaseClient
              .from('game_scores')
              .select('member_id, scores, created_at')
              .eq('room_id', roomId)
              .order('created_at', ascending: false)
              .limit(limit);

      // `response` を `List<Map<String, dynamic>>` にキャスト
      final List<Map<String, dynamic>> data =
          response.cast<Map<String, dynamic>>();

      // メンバーごとにスコアと `created_at` をグループ化
      final Map<int, List<Map<String, dynamic>>> groupedResults = {};

      for (var row in data) {
        final memberId = row['member_id'] as int;
        final score = (row['scores'] as num).toDouble(); // `num` → `double` に変換
        final createdAt = DateTime.parse(row['created_at'] as String);

        groupedResults.putIfAbsent(memberId, () => []).add({
          "score": score,
          "created_at": createdAt,
        });
      }

      // 必要なフォーマットに変換
      final List<Map<String, dynamic>> formattedResults = groupedResults.entries
          .map((entry) => {
                "member_id": entry.key,
                "scores": entry.value.map((e) => e["score"]).toList(),
                "created_at": entry.value.isNotEmpty
                    ? entry.value.first["created_at"]?.toIso8601String()
                    : null, // 最新の created_at を取得
              })
          .toList();

      return Success(formattedResults);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<Result<List<Map<String, dynamic>>>> fetchTodayResults(
      int roomId, bool isInitial, int limit) async {
    try {
      // 36時間前の時刻を計算
      final targetTime = DateTime.now().subtract(const Duration(hours: 36));

      final response = isInitial
          ? await supabaseClient
              .from('game_scores')
              .select('member_id, scores, created_at')
              .eq('room_id', roomId)
              .gte('created_at', targetTime)
          : await supabaseClient
              .from('game_scores')
              .select('member_id, scores, created_at')
              .eq('room_id', roomId)
              .gte('created_at', targetTime)
              .order('created_at', ascending: false)
              .limit(limit);

      // `response` を `List<Map<String, dynamic>>` にキャスト
      final List<Map<String, dynamic>> data =
          response.cast<Map<String, dynamic>>();

      // メンバーごとにスコアをグループ化する
      final Map<int, List<double>> groupedResults = {};

      for (var row in data) {
        final memberId = row['member_id'] as int;
        final score = (row['scores'] as num).toDouble();

        groupedResults.putIfAbsent(memberId, () => []).add(score);
      }

      // 必要なフォーマットに変換
      final List<Map<String, dynamic>> formattedResults = groupedResults.entries
          .map((entry) => {
                "member_id": entry.key,
                "scores": entry.value,
              })
          .toList();

      return Success(formattedResults);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }
}
