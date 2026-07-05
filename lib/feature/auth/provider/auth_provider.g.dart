// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthProvider)
final authProviderProvider = AuthProviderProvider._();

final class AuthProviderProvider
    extends $NotifierProvider<AuthProvider, AuthProviderState> {
  AuthProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authProviderHash();

  @$internal
  @override
  AuthProvider create() => AuthProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthProviderState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthProviderState>(value),
    );
  }
}

String _$authProviderHash() => r'98d5e88a6e17a19d189ba2a9b990cc2a35e10119';

abstract class _$AuthProvider extends $Notifier<AuthProviderState> {
  AuthProviderState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AuthProviderState, AuthProviderState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthProviderState, AuthProviderState>,
              AuthProviderState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
