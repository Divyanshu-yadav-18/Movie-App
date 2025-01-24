import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_app/presentation/search/widget/selectable_options.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOptions(
              title: "Movie",
              isSelectable: context.read<SelectableOptionCubit>().state ==
                  SearchType.movie,
              onTap: () => context.read<SelectableOptionCubit>().selectMovie(),
            ),
            const SizedBox(
              width: 10,
            ),
            SelectableOptions(
              title: "TV",
              isSelectable:
                  context.read<SelectableOptionCubit>().state == SearchType.tv,
              onTap: () => context.read<SelectableOptionCubit>().selectTV(),
            ),
          ],
        );
      },
    );
  }
}
