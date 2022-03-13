part of 'pizza_bloc.dart';

abstract class PizzaState extends Equatable {
  const PizzaState();

  @override
  List<Object> get props => [];
}

class PizzaInitial extends PizzaState {}

class PizzaLoaded extends PizzaState {
  const PizzaLoaded({required this.pizza});
  final List<Pizza> pizza;
  @override
  List<Object> get props => [pizza];
}
