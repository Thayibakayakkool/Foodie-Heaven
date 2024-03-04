import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/core/constants/firebase_details_constants.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/core/service/firebase_service.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/domain/entities/order_entity.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/bloc/order/order_bloc.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/settings_page/order_page/order_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/settings_page/settings_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/widgets/text_widget.dart';

class ConfirmOrderPage extends StatefulWidget {
  final int subTotal;
  final int deliveryFee;
  final int totalPrice;
  final dynamic orders;

  const ConfirmOrderPage(
      {super.key,
      required this.subTotal,
      required this.deliveryFee,
      required this.totalPrice,
      required this.orders});

  @override
  State<ConfirmOrderPage> createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  ValueNotifier<int> selects = ValueNotifier(0);

  select() {
    selects.value = selects.value + 1;
  }

  // int _type = 1;
  //
  // void _handleRadio(Object? e) => setState(() {
  //       _type = e as int;
  //     });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors().transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors().amber,
              )),
          title: textWidget('Payment', 30),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: FirebaseService.getUser(auth.currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Utils().loadingWidget();
              } else {
                var data = snapshot.data!.docs[0];
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: paymentMethod.length,
                        itemBuilder: (context, index) {
                          return ValueListenableBuilder(
                            valueListenable: selects,
                            builder: (context, value, child) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: size.width,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      border: value == index
                                          ? Border.all(color: AppColors().amber)
                                          : Border.all(color: AppColors().grey),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    select();
                                                  },
                                                  icon: Icon(
                                                    value == index
                                                        ? Icons.radio_button_on
                                                        : Icons.radio_button_off,
                                                    color: AppColors().amber,
                                                    size: 20,
                                                  )),
                                              Text(
                                                paymentMethod[index],
                                                style: value == index
                                                    ? regularTextStyle(
                                                        FontWeight.bold,
                                                        AppColors().amber,
                                                        18)
                                                    : regularTextStyle(
                                                        FontWeight.bold,
                                                        AppColors().grey,
                                                        18),
                                              )
                                            ],
                                          ),
                                          Image.network(
                                            paymentImage[index],
                                            width: 60,
                                            fit: BoxFit.cover,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),

                      kSizedBox25,
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Shipping Address',
                            style: regularTextStyle(
                                FontWeight.bold, AppColors().amber, 22),
                          )),
                      kSizedBox5,
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${data['name']}',
                            style: textStyle(AppColors().whiteColors, 18),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${data['address']}',
                            style: textStyle(AppColors().whiteColors, 18),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${data['phoneNo']}',
                            style: textStyle(AppColors().whiteColors, 17),
                          ))
                    ],
                  ),
                );
              }
            }),
        bottomNavigationBar: StreamBuilder(
            stream: FirebaseService.getUser(auth.currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: CircularProgressIndicator(
                  color: AppColors().amber,
                ));
              } else {
                var data = snapshot.data!.docs[0];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 9,
                    right: 8,
                  ),
                  child: SizedBox(
                    height: 220,
                    child: Column(
                      children: [
                        kSizedBox5,
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                            right: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sub Total',
                                style: regularTextStyle(
                                    FontWeight.bold, AppColors().amber, 19),
                              ),
                              Text(
                                '₹' ' ${widget.subTotal}',
                                style: textStyle(AppColors().whiteColors, 18),
                              )
                            ],
                          ),
                        ),
                        kSizedBox10,
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping',
                                style: regularTextStyle(
                                    FontWeight.bold, AppColors().amber, 19),
                              ),
                              Text(
                                '₹' ' ${widget.deliveryFee}',
                                style: textStyle(AppColors().whiteColors, 18),
                              )
                            ],
                          ),
                        ),
                        kSizedBox10,
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Price',
                                style: regularTextStyle(
                                    FontWeight.bold, AppColors().amber, 19),
                              ),
                              Text(
                                '₹' ' ${widget.totalPrice}',
                                style: textStyle(AppColors().whiteColors, 18),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _showSuccessDialog(
                                context,
                                () {
                                  BlocProvider.of<OrderBloc>(context)
                                      .add(OrderConfirmEvent(
                                          orderEntity: OrderEntity(
                                    subTotal: widget.subTotal,
                                    deliveryFee: widget.deliveryFee,
                                    totalPrice: widget.totalPrice,
                                    orders: widget.orders,
                                    name: data['name'].toString(),
                                    address: data['address'].toString(),
                                    phoneNo: data['phoneNo'].toString(),
                                    paymentMethod: paymentMethod[selects.value],
                                    orderBy: auth.currentUser!.uid,
                                    orderDate: formattedDate,
                                  )));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const OrderPage(),
                                      ));
                                },
                              );
                              clearCart();
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder()),
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors().amber)),
                            child: Text(
                              'Confrim Payment',
                              style: regularTextStyle(
                                  FontWeight.bold, AppColors().blackColors, 19),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }

  _showSuccessDialog(context, void Function()? func) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Successfully',
      desc: 'Your payment was done successfully',
      btnOkOnPress: func,
    )..show();
  }
}
