import 'package:flutter/material.dart';
import '../../../utils/lists/category_list.dart';
import '../cubit/cubit.dart';
class DropDownCategory extends StatelessWidget {
  const DropDownCategory({super.key, required this.cubit});
  final HomeCubit cubit;
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
        value: cubit.CategoryFilt,
        // Dropdown items
        items: CategoryLists.cameraLangItems.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        // When the user selects an item
        onChanged: (String? newValue){
          cubit.categoryFiltter(newValue!);
          cubit.topBarCubit(CategoryLists.cameraItems.indexOf(newValue));
          cubit.getData(CategoryLists.subCategoryList[0]["Photography cameras"]![CategoryLists.cameraItems.indexOf(newValue)].toString(),CategoryLists.cameraId[CategoryLists.cameraItems.indexOf(newValue)].toString());
        },
      ),
    );
  }
}