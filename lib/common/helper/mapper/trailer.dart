import 'package:movie_app/core/entity/trailer.dart';
import 'package:movie_app/core/models/trailer.dart';

class TrailerMapper {
  static TrailersEntity toEntity(TrailersModel TrailerModel) {
    return TrailersEntity(
      iso6391: TrailerModel.iso6391,
      iso31661: TrailerModel.iso31661,
      name: TrailerModel.name,
      key: TrailerModel.key,
      site: TrailerModel.site,
      size: TrailerModel.size,
      type: TrailerModel.type,
      official: TrailerModel.official,
      publishedAt: TrailerModel.publishedAt,
      id: TrailerModel.id,
    );
  }
}
