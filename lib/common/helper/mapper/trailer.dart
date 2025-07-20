import 'package:movie_app/core/entity/trailer.dart';
import 'package:movie_app/core/models/trailer.dart';

class TrailerMapper {
  static TrailersEntity toEntity(TrailersModel model) {
    return TrailersEntity(
      iso6391: model.iso6391,
      iso31661: model.iso31661,
      name: model.name,
      key: model.key,
      site: model.site,
      size: model.size,
      type: model.type,
      official: model.official,
      publishedAt: model.publishedAt,
      id: model.id,
    );
  }

  static List<TrailersEntity> fromList(List<dynamic> list) {
    return list.map((e) => toEntity(TrailersModel.fromJson(e))).toList();
  }
}
