import 'package:flutter/material.dart';
import '../../../utils/lists/category_list.dart';
class DropDownCategory extends StatelessWidget {
  const DropDownCategory({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 40,
      child: DropdownButton<String>(
        isExpanded: true,
        icon:const Icon(
          Icons.keyboard_arrow_down_outlined,
          size: 15,              // Change the icon size
        ),
        underline: Container(
          height: 0,
        ),
        hint:const Text('Select an option',style: TextStyle(
        ),),
        value: CategoryLists.cameraItems[0],
        // Dropdown items
        items: CategoryLists.cameraItems.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        // When the user selects an item
        onChanged: (String? newValue) {
        },
      ),
    );
  }
}