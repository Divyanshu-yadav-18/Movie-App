import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/common/widgets/appbar/appbar.dart';
import 'package:movie_app/core/configs/assets/app_vectors.dart';
import 'package:movie_app/presentation/home/widgeta/category_text.dart';
import 'package:movie_app/presentation/home/widgeta/now_playing_movies.dart';
import 'package:movie_app/presentation/home/widgeta/trending_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(AppVectors.logo),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: "Trending "),
            TrendingMovies(),
            CategoryText(title: "Now Playing "),
            NowPlayingMovies()
          ],
        ),
      ),
    );
  }
}
