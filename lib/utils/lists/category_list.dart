import 'package:easy_localization/easy_localization.dart';

class CategoryLists {
  List mainCategoryList = [
    "Photography cameras",
    "security cameras",
    "Mobile phones",
    "Computers and laptops",
    "Play Station",
  ];
  static final List<String> cameraItems = [
    'New cameras',//1
    'Used cameras',//2
    'New lenses',//3
    'Used lenses',//4
    'Lighting equipment',//5
    'Chargers and batteries',//6
    'Straps',//7
    'Camera bags',//8
    'Filters, hoods and lens covers',//9
    'Covers',//10
    'Screens',//11
    'Cables',//12
    'Memory cards and flash drives',//13
  ];
  static final List<String> cameraLangItems = [
    'cameras_new'.tr(), // 1
    'cameras_used'.tr(), // 2
    'lenses_new'.tr(), // 3
    'lenses_used'.tr(), // 4
    'lighting_equipment'.tr(), // 5
    'chargers_batteries'.tr(), // 6
    'straps'.tr(), // 7
    'camera_bags'.tr(), // 8
    'filters_hoods_lens_caps'.tr(), // 9
    'cases'.tr(), // 10
    'screen_protectors'.tr(), // 11
    'cables'.tr(), // 12
    'memory_cards_flash_drives'.tr(), // 13
  ];

  static final List<String> cameraId=[
    "JkqUHTmIy7m0VCVCFzeZ",//1
    "3WPsTRRDJ3d465Fdgb0q",//2
    "baTl2oxNFjb9aUvuyGGH",//3
    "cfWwnm0NfhRj6Z6yKjoD",//4
    "hq4is96U6QaxVkD5QFyh",//5
    "XBtzbEfSEpR8zSVYSbIe",//6
    "ovvBWoXBK7l2fIqopDvU",//7
    "WXVXWbmO6AAWNzZ010c2",//8
    "6VOyjNKTacCNW8awXYXG",//9
    "GPqlrB6JxBVuTdDGjLSd",//10
    "MGlYpEcYXoc0MHGsIx8U",//11
    "fuGgPwKCWFnllYAvJ520",//12
    "G055IkzMXa9ExG5vX5yp",//13
  ];
  static final List<String> phoneItems = [
    'new Mobile Phone ',
    'used Mobile Phone ',
    'Covers',
    'Screens',
    'Chargers',
    'Cables',
    'Stabilizer',
  ];
  static final List<String> securityCameraItems = [
    'DVR device',
    'NVR device',
    'Power supply',
    'Hard disks',
    'Cables',
  ];
  static final List<String> pcItems = [
    'New',
    'Import (used)',
    'PC Gaming',
    'Bags',
    'Speakers',
    'Reader',
    'Chargers',
    'Cables',
    'Hard disks',
    'RAM',
    'Headphones',
    'Accessories',
  ];
  static final List<String> psItems = [
    'New',
    'Used',
    'Controller',
    'Chargers',
  ];
  static final List <Map<String,List>>subCategoryList = [
    {
      "Photography cameras":cameraItems,
    },
    {
      "security cameras":securityCameraItems,
    },
    {
      "Mobile phones":phoneItems,
    },
    {
      "Computers and laptops":pcItems,
    },
    {
      "Play Station":psItems,
    },

  ];
  static final List hedarList=[
    "Fast and guaranteed \nshipping",
    "Exchange and return \nwithin a week",
    "3 months warranty \n on the user",
  ];
}
