import 'package:flutter/material.dart';
import '../../../utils/lists/category_list.dart';
class MainHeader extends StatelessWidget {
  const MainHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 1,
          child: Text(
            CategoryLists.hedarList[0],
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Text(
              CategoryLists.hedarList[1],
              style: const TextStyle(
                color: Colors.black,
              ),
            )),
        Expanded(
            flex: 1,
            child: Text(
              CategoryLists.hedarList[2],
              style: const TextStyle(
                color: Colors.black,
              ),
            )),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}