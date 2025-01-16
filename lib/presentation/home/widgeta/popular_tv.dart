import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/common/widgets/tv/tv_card.dart';
import 'package:movie_app/presentation/home/block/now_playing_cubit.dart';
import 'package:movie_app/presentation/home/block/now_playing_state.dart';
import 'package:movie_app/presentation/home/block/popular_tv_cubit.dart';
import 'package:movie_app/presentation/home/block/popular_tv_state.dart';

class PopularTV extends StatelessWidget {
  const PopularTV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTVCubit()..getPopularTV(),
      child: BlocBuilder<PopularTVCubit, PopularTVState>(
        builder: (context, state) {
          if (state is PopularTVLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PopularTVLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TVCard(tvEntity: state.tv[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: state.tv.length),
            );
          }
          if (state is FailureLoadedPopularTV) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
