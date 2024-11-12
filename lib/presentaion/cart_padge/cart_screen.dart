import 'package:camerastore/presentaion/cart_padge/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/images.dart';
import '../home_badge/widget/footer.dart';
import '../home_badge/widget/search_field.dart';
import 'cubit/cubit.dart';
import 'widget/cart_list.dart';
import 'widget/payment_cart.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    CartCubit cubit=CartCubit.get(context);
    cubit.getCartData();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Images.logo,
          height: 140,
          width: 140,
        ),
        backgroundColor: Colors.white,
        actions: const [
          SearchField(),
        ],
      ),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: BlocBuilder<CartCubit,MainCartState>(
          builder: (context,state) {
            return state is LoadCartDataState ? const Center(child: CircularProgressIndicator(),): Column(
              children: [
              Row(
                children: [
                  CartList(cartList: cubit.cartList,),
                  // const SizedBox(width: 300,),
                  // PaymentCart(totalCardPayment: cubit.totalCardPayment, cubit: cubit,),
                ],
              ),
              const Footer(),
            ],);
          }
        ),
      ),
    );
  }
}
