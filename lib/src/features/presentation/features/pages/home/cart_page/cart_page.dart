import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/firebase_constant.dart';
import 'package:foodie_heaven/src/core/constants/firebase_details_constants.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/core/service/firebase_service.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/cart_page/confirm_order_page.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/widgets/text_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    int deliveryFee = 30;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColors.transparent,
          title: textWidget('Cart', 32),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: FirebaseService.getCart(auth.currentUser!.uid),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Utils().loadingWidget();
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    'Cart is empty',
                    style: textStyleColor(appColors.amber),
                  ),
                );
              } else {
                var data = snapshot.data!.docs;
                subTotalCalculate(data);
                itemSnapshot = data;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 8, bottom: 5),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const StretchMotion(),
                          children: [
                            SlidableAction(
                                label: 'Delete',
                                backgroundColor: appColors.transparent,
                                foregroundColor: appColors.amber,
                                onPressed: (context) {
                                  FirebaseService.removeFromCart(data[index].id);
                                },
                                icon: Icons.delete),
                          ],
                        ),
                        child: Container(
                          width: 400,
                          height: 105,
                          decoration: BoxDecoration(
                              border: Border.all(color: appColors.amber),
                              borderRadius: BorderRadius.circular(22)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 42,
                                backgroundImage:
                                    NetworkImage('${data[index]['image']}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${data[index]['name']}',
                                          style: regularTextStyle(
                                              FontWeight.bold,
                                              appColors.amber,
                                              17),
                                        ),
                                        wSizedBox5,
                                        Text(' (x${data[index]['quantity']})',
                                            style: textStyle(
                                                appColors.whiteColors, 18))
                                      ],
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Text(
                                          '₹ ' '${data[index]['total']}',
                                          style: textStyle(
                                              appColors.whiteColors, 17),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }),
        bottomNavigationBar: StreamBuilder(
            stream: FirebaseService.getCart(auth.currentUser!.uid),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Utils().loadingWidget();
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    'Cart is empty',
                    style: textStyleColor(appColors.amber),
                  ),
                );
              } else {
                var data = snapshot.data!.docs;
                subTotalCalculate(data);
                itemSnapshot = data;
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 9,
                    right: 8,
                  ),
                  child: SizedBox(
                    height: 170,
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
                                    FontWeight.bold, appColors.amber, 19),
                              ),
                              Text(
                                '₹' ' $subTotal',
                                style: textStyle(appColors.whiteColors, 18),
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
                                'Delivery Fee',
                                style: regularTextStyle(
                                    FontWeight.bold, appColors.amber, 19),
                              ),
                              Text(
                                '₹' ' $deliveryFee',
                                style: textStyle(appColors.whiteColors, 18),
                              )
                            ],
                          ),
                        ),
                        kSizedBox20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: appColors.amber)),
                                    backgroundColor: MaterialStateProperty.all(
                                        appColors.blackColors)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text(
                                        'Total price ',
                                        style: regularTextStyle(FontWeight.bold,
                                            appColors.amber, 18),
                                      ),
                                    ),
                                    Text(
                                      '₹' ' ${subTotal + deliveryFee}',
                                      style:
                                          textStyle(appColors.whiteColors, 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {
                                  getProductDetails();
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ConfirmOrderPage(
                                      subTotal: subTotal,
                                      deliveryFee: deliveryFee,
                                      totalPrice: subTotal + deliveryFee,
                                      orders: FieldValue.arrayUnion(items),
                                    ),
                                  ));
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors().amber)),
                                child: Text(
                                  'Order Now',
                                  style: regularTextStyle(FontWeight.bold,
                                      AppColors().blackColors, 19),
                                ),
                              ),
                            ),
                          ],
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
}
