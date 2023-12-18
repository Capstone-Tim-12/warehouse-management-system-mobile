class VirtualAccountModel {
  String vaNumber;
  String xPaymentId;
  String vaName;
  String bankCode;
  int nominal;
  String expiredAt;

  VirtualAccountModel(
      {required this.vaNumber,
      required this.vaName,
      required this.bankCode,
      required this.nominal,
      required this.expiredAt,
      required this.xPaymentId});
}
