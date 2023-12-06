import 'package:capstone_wms/models/warehouse_model.dart';
import 'package:get/get.dart';

class WarehouseController extends GetxController {
  var selectedWarehouse = WarehouseModel(
          warehouseId: 0,
          name: '',
          regencyName: '',
          weeklyPrice: 0,
          monthlyPrice: 0,
          annuallyPrice: 0,
          image : []
          )
      .obs;

  void setSelectedWarehouse(WarehouseModel param) {
    selectedWarehouse.value = param;
  }
}
