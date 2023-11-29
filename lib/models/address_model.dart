class AddressModel {
  final String country;
  final String province;
  final int provinceId;
  final String regency;
  final int regencyId;
  final String district;
  final int districtId;
  final String fullAdress;

  AddressModel(
      {required this.country,
      required this.province,
      required this.provinceId,
      required this.regency,
      required this.regencyId,
      required this.district,
      required this.districtId,
      required this.fullAdress});
}
