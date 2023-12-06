class RentApplicationModel {
  final String token;
  final int warehouseId;
  final int paymentSchemeId;
  final int duration;
  final String dateEntry;

  RentApplicationModel({
    required this.token,
    required this.warehouseId,
    required this.paymentSchemeId,
    required this.duration,
    required this.dateEntry,
  });
}
