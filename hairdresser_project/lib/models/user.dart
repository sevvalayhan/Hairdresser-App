class User {
  late String userName;
  late String password;
  late String permission;
  late DateTime lastLogin;
  late DateTime lastLogout;
  late String ipAddress;

  
  User({
    required this.userName,
    required this.password,
    required this.permission,
    required this.lastLogin,
    required this.lastLogout,
    required this.ipAddress,
  });


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['userName'],
      password: json['password'],
      permission: json['permission'],
      lastLogin: DateTime.parse(json['lastLogin']),
      lastLogout: DateTime.parse(json['lastLogout']),
      ipAddress: json['ipAddress'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'password': password,
      'permission': permission,
      'lastLogin': lastLogin.toIso8601String(),
      'lastLogout': lastLogout.toIso8601String(),
      'ipAddress': ipAddress,
    };
  }
}
