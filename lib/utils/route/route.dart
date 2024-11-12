import 'package:beamer/beamer.dart';
import 'package:camerastore/presentaion/auth/login.dart';
import 'package:camerastore/presentaion/cart_padge/cart_screen.dart';
import 'package:camerastore/presentaion/check_out/screen_check_out.dart';
import 'package:camerastore/presentaion/home_badge/home_screen.dart';
import 'package:camerastore/presentaion/product/product_screen.dart';
import 'package:flutter/material.dart';
import '../../presentaion/auth/sign_up.dart';
class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pathPatterns = [
      BeamPage(
        child: HomeScreen(),
        key: ValueKey('/'),
      ),
    ];
    final String? checkOutId = state.pathParameters['check_out'];
    if (checkOutId!=null) {
      pathPatterns.add(
        BeamPage(
          key:   ValueKey('check_out/${checkOutId}'),
          child:ScreenCheckOut(shapingId: checkOutId,) ,
        ),
      );

    }
    if (state.uri.pathSegments.contains('cart')) {
      pathPatterns.add(
        const BeamPage(
          key: ValueKey('cart'),
          child: CartScreen(),
        ),
      );
    }
    if (state.uri.pathSegments.contains('home')) {
      pathPatterns.add(
      BeamPage(
        child: HomeScreen(),
        key: ValueKey('home'),
      ),);
    }
    if (state.uri.pathSegments.contains('sign_up')) {
      pathPatterns.add(
         BeamPage(
          key: ValueKey('sign_up'),
          child: SignUpScreen(),
        ),
      );
    }
    if (state.uri.pathSegments.contains('login')) {
      pathPatterns.add(
        BeamPage(
          key: ValueKey('login'),
          child: LoginScreen(),
        ),
      );
    }
    final String? ProductId = state.pathParameters['Category'];
    if (ProductId != null) {
      pathPatterns.add(
        BeamPage(
          key: ValueKey('Category/${ProductId}'),
          child: ProductScreen(
            id: ProductId,
          ),
        ),
      );
    }

    return pathPatterns;
  }
  @override
  // TODO: implement pathPatterns
  List<Pattern> get pathPatterns => [
    "/",
    '/home',
    "/login",
    "/sign_up",
    '/cart',
    '/Category',
    '/Category/:Category',
    '/check_out/:check_out',
    '/product',
  ];
}