// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_gateway.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supabaseHash() => r'bf569ca6e718c2eaa4101f9a8cfab3a761fba195';

/// See also [supabase].
@ProviderFor(supabase)
final supabaseProvider = Provider<SupabaseClient>.internal(
  supabase,
  name: r'supabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$supabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SupabaseRef = ProviderRef<SupabaseClient>;
String _$supabaseGatewayHash() => r'aa4140058034a657b58e9061d741b32e31ec7ae9';

/// See also [SupabaseGateway].
@ProviderFor(SupabaseGateway)
final supabaseGatewayProvider =
    NotifierProvider<SupabaseGateway, void>.internal(
  SupabaseGateway.new,
  name: r'supabaseGatewayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supabaseGatewayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SupabaseGateway = Notifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
