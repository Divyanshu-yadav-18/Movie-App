class UserModel {
  final String sessionId;

  UserModel({required this.sessionId});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      sessionId: json['session_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'session_id': sessionId,
    };
  }
}
