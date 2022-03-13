part of 'pizza_bloc.dart';

abstract class PizzaEvent extends Equatable {
  const PizzaEvent();

  @override
  List<Object> get props => [];
}

class LoadPizzaCounter extends PizzaEvent {}

class AddPizza extends PizzaEvent {
  const AddPizza({required this.pizza});
  final Pizza pizza;

  @override
  List<Object> get props => [pizza];
}

class RemovePizza extends PizzaEvent {
  const RemovePizza({required this.pizza});
  final Pizza pizza;

  @override
  List<Object> get props => [pizza];
}
