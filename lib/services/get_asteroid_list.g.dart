// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_asteroid_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $getAsteroidListHash() => r'55482435ca1b2fbd9fe3522df1f3729320c834e2';

/// See also [getAsteroidList].
class GetAsteroidListProvider
    extends AutoDisposeFutureProvider<List<Asteroid>> {
  GetAsteroidListProvider(
    this.startDate,
    this.endDate,
  ) : super(
          (ref) => getAsteroidList(
            ref,
            startDate,
            endDate,
          ),
          from: getAsteroidListProvider,
          name: r'getAsteroidListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $getAsteroidListHash,
        );

  final String startDate;
  final String endDate;

  @override
  bool operator ==(Object other) {
    return other is GetAsteroidListProvider &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetAsteroidListRef = AutoDisposeFutureProviderRef<List<Asteroid>>;

/// See also [getAsteroidList].
final getAsteroidListProvider = GetAsteroidListFamily();

class GetAsteroidListFamily extends Family<AsyncValue<List<Asteroid>>> {
  GetAsteroidListFamily();

  GetAsteroidListProvider call(
    String startDate,
    String endDate,
  ) {
    return GetAsteroidListProvider(
      startDate,
      endDate,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Asteroid>> getProviderOverride(
    covariant GetAsteroidListProvider provider,
  ) {
    return call(
      provider.startDate,
      provider.endDate,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getAsteroidListProvider';
}
