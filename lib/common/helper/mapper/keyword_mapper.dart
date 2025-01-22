import 'package:movie_app/core/entity/keyboard.dart';
import 'package:movie_app/core/models/keywords.dart';

class KeywordMapper {
  static KeywordEntity toEntity(KeywordModel keywordModel) {
    return KeywordEntity(
      name: keywordModel.name,
      id: keywordModel.id,
    );
  }
}
