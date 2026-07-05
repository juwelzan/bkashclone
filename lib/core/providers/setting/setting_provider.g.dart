// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SettingProvider)
final settingProviderProvider = SettingProviderProvider._();

final class SettingProviderProvider
    extends $NotifierProvider<SettingProvider, SettingState> {
  SettingProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingProviderHash();

  @$internal
  @override
  SettingProvider create() => SettingProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingState>(value),
    );
  }
}

String _$settingProviderHash() => r'76d118edb5c25824e227aa3e9db80cb2fbf59505';

abstract class _$SettingProvider extends $Notifier<SettingState> {
  SettingState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SettingState, SettingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SettingState, SettingState>,
              SettingState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
