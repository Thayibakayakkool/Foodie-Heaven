import 'package:equatable/equatable.dart';

class PaymentModel extends Equatable{
  final int id;
  final String name;
  final String image;

  const PaymentModel({required this.id, required this.name, required this.image});

  @override
  List<Object?> get props =>[id,name,image];
}
List<PaymentModel> payment=[
  PaymentModel(id: 0, name: 'Paytm', image:'https://w7.pngwing.com/pngs/827/101/png-transparent-paytm-logo-online-payment-brand-flat-icon-thumbnail.png',),
  PaymentModel(id: 1, name: 'Google Pay', image:  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Google_Pay_Logo.svg/800px-Google_Pay_Logo.svg.png',),
  PaymentModel(id: 2, name: 'Credit/Debit card', image:   'https://e7.pngegg.com/pngimages/836/850/png-clipart-credit-card-debit-card-mastercard-payment-card-credit-card-payment-internet.png',),
  PaymentModel(id: 3, name: 'Cash on Delivery', image:   'https://static.vecteezy.com/system/resources/previews/010/595/642/original/cod-cash-on-delivery-truck-car-graphic-free-vector.jpg'),
];