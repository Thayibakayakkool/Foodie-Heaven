import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_heaven/src/features/data/models/payment_model.dart';
import 'package:intl/intl.dart';

//height

SizedBox kSizedBox45 = SizedBox(
  height: 45.h,
);

SizedBox kSizedBox30 = SizedBox(
  height: 30.h,
);

SizedBox kSizedBox25 = SizedBox(
  height: 25.h,
);

SizedBox kSizedBox20 = SizedBox(
  height: 20.h,
);

SizedBox kSizedBox15 = SizedBox(
  height: 15.h,
);

SizedBox kSizedBox10 = SizedBox(
  height: 10.h,
);

SizedBox kSizedBox5 = SizedBox(
  height: 5.h,
);

//width

SizedBox wSizedBox15 = SizedBox(
  width: 15.w,
);

SizedBox wSizedBox10 = SizedBox(
  width: 10.w,
);
SizedBox wSizedBox5 = SizedBox(
  width: 5.w,
);

//date
var now = DateTime.now();
var format = DateFormat('yyy-MM-dd');
String formattedDate = format.format(now);

//payment
const paymentMethod = ['Paytm', 'Google Pay','Credit/Debit card','Cash on Delivery'];
const paymentImage = [
  'https://w7.pngwing.com/pngs/827/101/png-transparent-paytm-logo-online-payment-brand-flat-icon-thumbnail.png',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Google_Pay_Logo.svg/800px-Google_Pay_Logo.svg.png',
  'https://e7.pngegg.com/pngimages/836/850/png-clipart-credit-card-debit-card-mastercard-payment-card-credit-card-payment-internet.png',
  'https://static.vecteezy.com/system/resources/previews/010/595/642/original/cod-cash-on-delivery-truck-car-graphic-free-vector.jpg'
];

