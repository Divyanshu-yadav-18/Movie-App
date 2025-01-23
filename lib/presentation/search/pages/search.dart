import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/appbar/appbar.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_app/presentation/search/widget/search_feild.dart';
import 'package:movie_app/presentation/search/widget/selectable_options.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Search'),
      ),
      body: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => SelectableOptionCubit())],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SearchFeild(),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<SelectableOptionCubit, SearchType>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableOptions(
                        title: "Movie",
                        isSelectable:
                            context.read<SelectableOptionCubit>().state ==
                                SearchType.movie,
                        onTap: () =>
                            context.read<SelectableOptionCubit>().selectMovie(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SelectableOptions(
                        title: "TV",
                        isSelectable:
                            context.read<SelectableOptionCubit>().state ==
                                SearchType.tv,
                        onTap: () =>
                            context.read<SelectableOptionCubit>().selectTV(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
