class AuthProviderState {
  final bool isNumberValid;
  final bool isOtpValid;
  final bool isPasswordValid;

  AuthProviderState({
    this.isNumberValid = false,
    this.isOtpValid = false,
    this.isPasswordValid = false,
  });

  AuthProviderState copyWith({
    bool? isNumberValid,
    bool? isOtpValid,
    bool? isPasswordValid,
  }) {
    return AuthProviderState(
      isNumberValid: isNumberValid ?? this.isNumberValid,
      isOtpValid: isOtpValid ?? this.isOtpValid,
      isPasswordValid: isPasswordValid ?? this.isNumberValid,
    );
  }
}
