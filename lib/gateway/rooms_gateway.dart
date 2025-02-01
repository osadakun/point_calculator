import 'package:point_calculator/gateway/supabase_gateway.dart';
import 'package:point_calculator/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'rooms_gateway.g.dart';

@Riverpod(keepAlive: true)
class RoomsGateway extends _$RoomsGateway {
  late final SupabaseClient supabaseClient;
  @override
  void build() {
    supabaseClient = ref.read(supabaseGatewayProvider);
  }

  Future<Result<void>> createRoom(String roomName) async {
    try {
      await supabaseClient.from('rooms').insert({
        'room_name': roomName,
      });
      return const Success(null);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<Result<List>> fetchRooms() async {
    try {
      final response = await supabaseClient.from('rooms').select();
      return Success(response);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }
}
