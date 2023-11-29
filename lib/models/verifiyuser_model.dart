class VerifyUser {
  String email = '';
  String nik = '';
  String fullName = '';
  String districtId = '';
  String address = '';
  String gender = '';
  String placeBirth = '';
  String? dateBirth;
  String work = '';
  String citizenship = '';

  VerifyUser(
      {required this.email,
      required this.nik,
      required this.fullName,
      required this.districtId,
      required this.address,
      required this.gender,
      required this.placeBirth,
      this.dateBirth,
      required this.work,
      required this.citizenship});
}
