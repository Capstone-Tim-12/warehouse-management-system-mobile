class IdentityModel {
  final String nik;
  final String fullName;
  final String gender;
  final String? genderId;
  final String birthPlace;
  final DateTime birthDate;
  final String job;
  final String citizenship;

  IdentityModel(
      {required this.nik,
      required this.fullName,
      required this.gender,
      this.genderId,
      required this.birthPlace,
      required this.birthDate,
      required this.job,
      required this.citizenship});
}
