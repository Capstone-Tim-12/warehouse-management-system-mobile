class UserModel {
  String id;
  int userId;
  String? email;
  String name;
  String picKTP;
  String selKTP;
  bool? verified;

  UserModel(
      {required this.id,
      required this.userId,
      this.email,
      required this.name,
      required this.picKTP,
      required this.selKTP,
      this.verified
      });
}
