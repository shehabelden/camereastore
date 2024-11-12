import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/controllers.dart';
import '../../utils/images.dart';
import '../cart_padge/cubit/cubit.dart';
import '../cart_padge/cubit/state.dart';
import '../home_badge/widget/footer.dart';
import '../home_badge/widget/search_field.dart';
import 'mob_check_out.dart';
import 'widget/check_out_container.dart';
class ScreenCheckOut extends StatelessWidget {
  const ScreenCheckOut({super.key, required this.shapingId});
  final String shapingId;
  @override
  Widget build(BuildContext context) {
    Controllers.emailController;
    Controllers.firstNameController;
    Controllers.lastNameController;
    Controllers.addressController;
    Controllers.phoneController;
    CartCubit cubit=CartCubit.get(context);
    cubit.getOrderData(shapingId);
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return BlocBuilder<CartCubit,MainCartState>(
      builder: (context,state) {
        return  LayoutBuilder(
            builder: (context, constraints) {
            return constraints.maxWidth<= 1200?ScreenCheckOutMobile(shapingId:shapingId) : Scaffold(
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
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                           SizedBox(
                            width: width*.4,
                            child: Column(
                              children: [
                                SizedBox(height: height*.0821917808219178,),
                                TextFormField(

                                  controller: Controllers.firstNameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your First Name';
                                    }
                                    // Add email validation logic here if needed
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "first name",
                                      contentPadding:const EdgeInsets.only(top: 25,bottom: 25,left: 20),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height*.0821917808219178,),
                                TextFormField(
                                  controller: Controllers.lastNameController,

                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your Last Name';
                                    }
                                    // Add email validation logic here if needed
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "last name",
                                    contentPadding:const EdgeInsets.only(top: 25,bottom: 25,left: 20),
                                    border: OutlineInputBorder(

                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height*.0821917808219178,),
                                TextFormField(
                                  controller: Controllers.addressController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your Address';
                                    }
                                    // Add email validation logic here if needed
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Address",
                                    contentPadding:const EdgeInsets.only(top: 25,bottom: 25,left: 20),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: CheckOutContainer(cubit:cubit,shapingId:shapingId, userData: {
                              "email":Controllers.emailController.text,
                              "first_name":Controllers.firstNameController.text,
                              "last_name":Controllers.lastNameController.text,
                              "address":Controllers.addressController.text,
                              "phone":Controllers.phoneController.text,
                              "stats":true,
                            },),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height*.0821917808219178,),
                    Row(
                      children: [
                        SizedBox(
                          width: width*.4,
                          child: TextFormField(
                            controller: Controllers.phoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone';
                              }
                              // Add email validation logic here if needed
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "phone",
                              contentPadding:const EdgeInsets.only(top: 25,bottom: 25,left: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        SizedBox(
                          width: width*.4,
                          child: TextFormField(
                            controller: Controllers.emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email ';
                              }
                              // Add email validation logic here if needed
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "email",
                              contentPadding:const EdgeInsets.only(top: 25,bottom: 25,left: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 95,),
                    const Footer(),
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }
}