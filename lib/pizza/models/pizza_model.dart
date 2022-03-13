import 'package:equatable/equatable.dart';

class Pizza extends Equatable {
  const Pizza({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String imageUrl;

  @override
  List<Object?> get props => [id, name, imageUrl];

  static List<Pizza> pizza = [
    const Pizza(
      id: '1',
      name: 'Margherita',
      imageUrl: 'assets/pizza.png',
    ),
    const Pizza(
      id: '2',
      name: 'Pepperoni',
      imageUrl: 'assets/pizza2.png',
    ),
  ];
}
