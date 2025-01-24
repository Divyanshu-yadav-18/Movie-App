import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/appbar/appbar.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_app/presentation/search/widget/search_content.dart';
import 'package:movie_app/presentation/search/widget/search_feild.dart';
import 'package:movie_app/presentation/search/widget/search_options.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Search'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectableOptionCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SearchFeild(),
              SizedBox(
                height: 16,
              ),
              SearchOptions(),
              SizedBox(
                height: 16,
              ),
              Expanded(child: SearchContent()),
            ],
          ),
        ),
      ),
    );
  }
}
