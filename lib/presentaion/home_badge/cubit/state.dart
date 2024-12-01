abstract class MainHomeState {}

class InitHomeState extends MainHomeState {}

class CustomBottomBarState extends MainHomeState {}

class TopBottomBarState extends MainHomeState {}

class LoadState extends MainHomeState {}
class ProductLoadState extends MainHomeState {}

class GerDataState extends MainHomeState {}
class PlasState extends MainHomeState {}
class MinasState extends MainHomeState {}
class GetProductDataState extends MainHomeState {}
class AddProductCart extends MainHomeState {}
class SlideMangerState extends MainHomeState {}
class CategoryFiltterState extends MainHomeState {}
class ChangeLanguageSuccessState extends MainHomeState {}
class ChangeLanguage extends MainHomeState {
  final String languageCode;
  ChangeLanguage({required this.languageCode});

  @override
  List<Object?> get props => [languageCode];
}

class ChangeCounter extends MainHomeState {
  final int count;
  ChangeCounter({required this.count});

  @override
  List<Object?> get props => [count];
}