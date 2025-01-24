import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit.dart';

class SearchFeild extends StatelessWidget {
  const SearchFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          context.read<SearchCubit>().search(
                value,
                context.read<SelectableOptionCubit>().state,
              );
        }
      },
      decoration: const InputDecoration(hintText: "Search..."),
    );
  }
}
