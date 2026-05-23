import 'dart:math';

import 'package:bkashclone/feature/auth/provider/auth_provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthProvider extends _$AuthProvider {
  AuthProvider();
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

  bool isValid0Number(String number) {
    final regex = RegExp(r'^0');
    return !regex.hasMatch(number);
  }

  bool isValid1Number(String number) {
    final regex = RegExp(r'^.1');
    if (number.length > 1) {
      return !regex.hasMatch(number);
    } else {
      return false;
    }
  }

  bool isValid3Number(String number) {
    final regex = RegExp(r'^..[3-9]');
    if (number.length > 2) {
      return !regex.hasMatch(number);
    } else {
      return false;
    }
  }

  bool isValidCheckLength(String number) {
    final regex = RegExp(r'^\d{11}$');

    return !regex.hasMatch(number);
  }

  void numberUpdate(String number) {
    state = state.copyWith(number: number);
  }

  Future<void> autoOtoField() async {
    final random = Random();
    await Future.delayed(Duration(seconds: 10), () {
      final otp1 = random.nextInt(9);
      final otp2 = random.nextInt(9);
      final otp3 = random.nextInt(9);
      final otp4 = random.nextInt(9);
      final otp5 = random.nextInt(9);
      final otp6 = random.nextInt(9);
      final otp = "$otp1$otp2$otp3$otp4$otp5$otp6";
      state = state.copyWith(otp: otp);
    });
  }
}
