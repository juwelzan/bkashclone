import 'package:bkashclone/feature/auth/provider/auth_provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthProvider extends _$AuthProvider {
  @override
  AuthProviderState build() => AuthProviderState();

  void isNumberValidUpdate(bool valid) {
    state = state.copyWith(isNumberValid: valid);
  }

  void isPasswordValidUpdate(bool valid) {
    state = state.copyWith(isPasswordValid: valid);
  }

  void isOtpValidUpdate(bool valid) {
    state = state.copyWith(isOtpValid: valid);
  }

  bool isValid01Number(String number) {
    final regex = RegExp(r'^0');
    return !regex.hasMatch(number);
  }

  bool isValidCheckLength(String number) {
    final regex = RegExp(r'^\d{11}$');

    return !regex.hasMatch(number);
  }
}
