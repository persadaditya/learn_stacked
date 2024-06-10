import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'counter_viewmodel.dart';

class CounterView extends StackedView<CounterViewModel> {
  final int startIndex;
  const CounterView({Key? key, required this.startIndex}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CounterViewModel viewModel,
    Widget? child,
  ) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
            onPressed: viewModel.backToHome,
            icon: const Icon(Icons.arrow_back_ios_sharp)),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Center(
          child: Text(
            '${viewModel.counter}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }

  ///use this to pass data from open view to viewModel
  @override
  void onViewModelReady(CounterViewModel viewModel) {
    viewModel.updateCounterFromHome(startIndex);
  }

  @override
  CounterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CounterViewModel();
}
