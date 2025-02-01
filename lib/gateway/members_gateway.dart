import 'package:point_calculator/gateway/supabase_gateway.dart';
import 'package:point_calculator/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'members_gateway.g.dart';
@riverpod
class MembersGateway extends _$MembersGateway {
  late final SupabaseClient supabaseClient;
  @override
  void build() {
    supabaseClient = ref.read(supabaseGatewayProvider);
  }

  Future<Result<List>> fetchMembers() async {
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
