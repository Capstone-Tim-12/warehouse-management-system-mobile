class SearchWarehouse {
  String token = '';
  String search = '';
  String maxPrice = '';
  String minPrice = '';
  String minSize = '';
  String maxSize = '';
  bool? recommended = false;
  bool? lowerPrice = false;
  bool? higherPrice = false;

  SearchWarehouse({
    required this.token,
    required this.search,
    required this.maxPrice,
    required this.minPrice,
    required this.minSize,
    required this.maxSize,
    this.higherPrice,
    this.lowerPrice,
    this.recommended,
  });
}
