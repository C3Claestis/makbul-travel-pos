// role_model.dart
class RoleModel {
  final int id;
  final String titleName;
  final String description;

  RoleModel({required this.id, required this.titleName, required this.description});
}

// user_model.dart
class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String status;
  final RoleModel role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.role,
  });
}