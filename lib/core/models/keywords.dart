class KeywordModel {
  KeywordModel({
    required this.name,
    required this.id,
  });

  final String? name;
  final int? id;

  factory KeywordModel.fromJson(Map<String, dynamic> json) {
    return KeywordModel(
      name: json['name'] as String?,
      id: json['id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}
