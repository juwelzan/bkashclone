class AuthProviderState {
  bool isNumberValid;
  bool isOtpValid;
  bool isPasswordValid;
  String number, otp;

  AuthProviderState({
    this.isNumberValid = false,
    this.isOtpValid = false,
    this.isPasswordValid = false,
    this.number = "",
    this.otp = "",
  });

  AuthProviderState copyWith({
    bool? isNumberValid,
    bool? isOtpValid,
    bool? isPasswordValid,
    String? number,
    String? otp,
  }) {
    return AuthProviderState(
      isNumberValid: isNumberValid ?? this.isNumberValid,
      isOtpValid: isOtpValid ?? this.isOtpValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      number: number ?? this.number,
      otp: otp ?? this.otp,
    );
  }
}
