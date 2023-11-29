class LocationCollectionModel {
  final String id;
  final String name;

  LocationCollectionModel({required this.id, required this.name});
  
  @override
  String toString() {
    return '{id: $id, name: $name}';
  }
}
