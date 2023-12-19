class WarehouseModel {
  int warehouseId;
  String name;
  String regencyName;
  var weeklyPrice;
  var monthlyPrice;
  var annuallyPrice;
  List? image;

  WarehouseModel({
    required this.warehouseId,
    required this.name,
    required this.regencyName,
    required this.weeklyPrice,
    required this.monthlyPrice,
    required this.annuallyPrice,
    this.image,
  });
}
