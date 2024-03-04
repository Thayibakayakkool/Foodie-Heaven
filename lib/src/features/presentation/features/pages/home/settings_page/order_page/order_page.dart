import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/core/service/firebase_service.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/settings_page/order_page/order_details_page.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors appColors=AppColors();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: appColors.amber,
          ),
        ),
        title: Text(
          'My Orders',
          style:
              TextStyle(fontWeight: FontWeight.bold, color:appColors.amber,fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseService.getAllOrders(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Utils().loadingWidget();
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
                child: Text(
              'No orders yet!',
              style: textStyleColor(appColors.amber),
            ));
          } else {
            var data = snapshot.data!.docs;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: appColors.amber),
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: Text(
                        "${index + 1}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: appColors.whiteColors),
                      ),
                      title: Text(
                        data[index]['orderDate'].toString(),
                        style: TextStyle(
                            color: appColors.whiteColors,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        data[index]['address'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: appColors.amber),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderDetailsPage(
                                    data: data[index],
                                  ),
                                ));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: appColors.amber,
                          )),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
