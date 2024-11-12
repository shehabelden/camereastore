import 'package:flutter/material.dart';

import '../../../utils/controllers.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            height: 100,
            width:constraints.maxWidth <= 1200? 500 : 150,
            child: TextField(
              controller: Controllers.searchController,
              decoration: InputDecoration(
                hintText: "search",
                border: OutlineInputBorder(
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
