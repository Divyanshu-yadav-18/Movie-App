import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/generic_data_cubit.dart';
import 'package:movie_app/common/bloc/generic_data_state.dart';
import 'package:movie_app/core/entity/keyboard.dart';
import 'package:movie_app/domain/tv/usecases/get_keywords.dart';
import 'package:movie_app/service_locator.dart';

class TVKeywords extends StatelessWidget {
  final int tvId;
  const TVKeywords({required this.tvId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<KeywordEntity>>(sl<GetKeywordsUseCase>(), params: tvId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DataLoaded) {
            List<KeywordEntity> keywords = state.data;
            return Wrap(
              children: keywords
                  .map((item) => Chip(
                        label: Text(item.name!),
                      ))
                  .toList(),
            );
          }
          if (state is FailureLoadData) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
