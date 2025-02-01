import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_gateway.g.dart';

@Riverpod(keepAlive: true)
SupabaseClient supabaseGateway(Ref ref) {
  return Supabase.instance.client;
}