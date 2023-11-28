import 'package:equatable/equatable.dart';

class Shop extends Equatable {
  final String name;
  final dynamic price;
  final String descrption;
  final String imagePath;

  Shop(
      {required this.name,
      required this.price,
      required this.descrption,
      required this.imagePath});

  @override
  // TODO: implement props
  List<Object?> get props => [name, price, descrption, imagePath];
}
