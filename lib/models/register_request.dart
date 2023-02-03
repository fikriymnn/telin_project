class RegisterRequest {
  RegisterRequest({
    required this.username,
    required this.password,
    required this.email,
  });
  late final String username;
  late final String password;
  late final String email;

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['password'] = password;
    _data['email'] = email;
    return _data;
  }
}
