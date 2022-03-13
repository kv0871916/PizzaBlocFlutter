import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/pizza/models/pizza_model.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(PizzaInitial()) {
    on<LoadPizzaCounter>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(const PizzaLoaded(pizza: <Pizza>[]));
    });
    on<AddPizza>((event, emit) {
      if (state is PizzaLoaded) {
        final state = this.state as PizzaLoaded;
        emit(
          PizzaLoaded(
            pizza: List.from(state.pizza)
              ..add(
                event.pizza,
              ),
          ),
        );
      }
    });
    on<RemovePizza>((event, emit) {
      if (state is PizzaLoaded) {
        final state = this.state as PizzaLoaded;
        emit(
          PizzaLoaded(
            pizza: List.from(state.pizza)
              ..remove(
                event.pizza,
              ),
          ),
        );
      }
    });
  }
}
