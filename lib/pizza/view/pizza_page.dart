// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/l10n/l10n.dart';
import 'package:my_app/pizza/bloc/pizza_bloc.dart';
import 'package:my_app/pizza/models/pizza_model.dart';

class PizzaPage extends StatelessWidget {
  const PizzaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PizzaBloc()..add(LoadPizzaCounter()),
      child: const PizzaView(),
    );
  }
}

class PizzaView extends StatelessWidget {
  const PizzaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<PizzaBloc, PizzaState>(
      builder: (BuildContext context, state) {
        if (state is PizzaInitial) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.orangeAccent,
            ),
          );
        }
        if (state is PizzaLoaded) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amber,
              title: Text(
                l10n.pizzaApp,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            body: Center(
              child: PizzaImageBody(state: state),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.amber,
                  onPressed: () {
                    context.read<PizzaBloc>().add(
                          AddPizza(
                            pizza: Pizza.pizza[0],
                          ),
                        );
                  },
                  child: const Icon(Icons.local_pizza_outlined),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  backgroundColor: Colors.amber,
                  onPressed: () {
                    context.read<PizzaBloc>().add(
                          RemovePizza(
                            pizza: Pizza.pizza[0],
                          ),
                        );
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  backgroundColor: Colors.amber,
                  onPressed: () {
                    context.read<PizzaBloc>().add(
                          AddPizza(
                            pizza: Pizza.pizza[1],
                          ),
                        );
                  },
                  child: const Icon(Icons.local_pizza),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  backgroundColor: Colors.amber,
                  onPressed: () {
                    context.read<PizzaBloc>().add(
                          RemovePizza(
                            pizza: Pizza.pizza[1],
                          ),
                        );
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}

class PizzaImageBody extends StatelessWidget {
  const PizzaImageBody({
    Key? key,
    required this.state,
  }) : super(key: key);

  final PizzaLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          state.pizza.length.toString(),
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              for (var i = 0; i < state.pizza.length; i++)
                Positioned(
                  left: Random().nextInt(250).toDouble(),
                  right: Random().nextInt(400).toDouble(),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.height * 0.5,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: state.pizza[i].imageUrl.isNotEmpty
                        ? Image.network(
                            state.pizza[i].imageUrl,
                            fit: BoxFit.contain,
                          )
                        : Container(),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
