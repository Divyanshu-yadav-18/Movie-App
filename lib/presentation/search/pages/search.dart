import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/appbar.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SearchFeild(),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableOptions(
                  title: "Movie",
                  isSelectable: true,
                  onTap: () => {},
                ),
                const SizedBox(
                  width: 10,
                ),
                SelectableOptions(
                  title: "TV",
                  isSelectable: false,
                  onTap: () => {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
