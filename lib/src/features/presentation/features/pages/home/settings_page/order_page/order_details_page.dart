import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/settings_page/order_page/order_place_order.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/widgets/text_widget.dart';

class OrderDetailsPage extends StatelessWidget {
  final dynamic data;

  const OrderDetailsPage({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    AppColors appColors=AppColors();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: appColors.amber,
          ),
        ),
        backgroundColor: appColors.transparent,
        title: Text(
          'Order Details',
          style:
              TextStyle(fontWeight: FontWeight.bold, color:appColors.amber,fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textWidget('Order Product', 20),
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(data['orders'].length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlaceDetails(
                          title1: data['orders'][index]['name'],
                          title2: data['orders'][index]['total'],
                          d1: "${data['orders'][index]['quantity']}",
                          image: data['orders'][index]['image'],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textWidget('Delivery Address', 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  '${data['address']}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: appColors.whiteColors,
                      fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  '${data['phoneNo']}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: appColors.whiteColors,
                      fontSize: 17),
                ),
              ),
              kSizedBox5,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kSizedBox5,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textWidget('Order Payment Details', 20),
                  ),
                  kSizedBox5,
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment Method',
                          style: textStyle(appColors.whiteColors, 18),
                        ),
                        Text(
                          '${data['paymentMethod']}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: appColors.whiteColors,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  kSizedBox10,
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date',
                          style: textStyle(appColors.whiteColors, 18),
                        ),
                        Text(
                          '${data['orderDate']}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: appColors.amber,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  kSizedBox10,
                  Divider(
                    color: appColors.amber,
                  ),
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
                          '₹' ' ${data['subTotal']}',
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
                          '₹' ' ${data['deliveryFee']}',
                          style: textStyle(appColors.whiteColors, 18),
                        )
                      ],
                    ),
                  ),
                  kSizedBox10,
                  Divider(
                    color: appColors.amber,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price',
                          style: regularTextStyle(
                              FontWeight.bold, appColors.amber, 19),
                        ),
                        Text(
                          '₹' ' ${data['totalPrice']}',
                          style: textStyle(appColors.whiteColors, 18),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
