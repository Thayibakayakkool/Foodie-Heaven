import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/core/constants/constants.dart';
import 'package:foodie_heaven/src/core/constants/styles.dart';
import 'package:foodie_heaven/src/core/service/firebase_service.dart';
import 'package:foodie_heaven/src/core/utils/utils.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/home/categories_page/product_details_page/product_details_page.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppColors appColors=AppColors();
    return SizedBox(
      height: 110,
      child: FutureBuilder(
        future: FirebaseService.getPopularProduct(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Utils().loadingWidget();
          } else if (snapshot.data!.docs.isEmpty) {
            return Text(
              'No Popular Products',
              style: textStyleColor(appColors.amber),
            );
          } else {
            var data = snapshot.data!.docs;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProductDetailsPage(
                            image: data[index]['image'],
                            desc: data[index]['desc'],
                            rating: data[index]['rating'],
                            calories: data[index]['calories'],
                            time: data[index]['time'],
                            price: data[index]['price'],
                            name: data[index]['name'],
                            id: data[index]['id']);
                      },
                    ));
                  },
                  child: Container(
                    width: 320,
                    decoration: BoxDecoration(
                      border: Border.all(color: appColors.amber),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(data[index]['image']),
                            radius: 45,
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 2, top: 8),
                              child: Text(
                                data[index]['name'],
                                style: regularTextStyle(
                                    FontWeight.bold, AppColors().amber, 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            kSizedBox5,
                            Text('₹ ' '${data[index]['price']}',
                                style:
                                    textStyle(appColors.amberShade700, 15)),
                            Padding(
                              padding: const EdgeInsets.only(left: 120),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.star,
                                        size: 22,
                                        color: appColors.amber,
                                      )),
                                  Text(
                                    '${data[index]['rating']}',
                                    style:
                                        textStyle(appColors.whiteColors, 15),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
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
