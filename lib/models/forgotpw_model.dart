class ForgotPasswordModel {
  final String verifyId;
  final String email;
  final String? newPassword;

  ForgotPasswordModel(
      {required this.verifyId, required this.email, this.newPassword});
}
