import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_basics/redux/actions.dart';
import 'package:flutter_redux_basics/redux/app_state.dart';
import 'package:flutter_redux_basics/redux/reducers.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<AppState> store = Store(reducer,
      initialState:
          AppState(counter: 0, text: "Init", widget: const Icon(Icons.image)));

  runApp(StoreProvider(
    store: store,
    child: const MaterialApp(
      home: _Counter(),
    ),
  ));
}

class _Counter extends StatelessWidget {
  const _Counter();

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    String inputText = "";

    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Redux"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.all(16),
              child: StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (context, vm) => vm.widget,
              ),
            ),
            ElevatedButton(
                onPressed: () => store.dispatch(loadImageThunkAction(store)),
                child: const Text('Get Image')),
            const SizedBox(height: 8),
            Container(
              width: 200,
              child: TextField(
                onChanged: (value) => inputText = value,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () =>
                        store.dispatch(SetTextAction(text: inputText)),
                    child: const Text("SET")),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () => store.dispatch(ResetTextAction()),
                    child: const Text("RESET")),
                const SizedBox(
                  height: 56,
                ),
              ],
            ),
            StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (context, vm) => Text(vm.text)),
            const SizedBox(height: 16),
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) => Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 32),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => store.dispatch(calcCountThunkAction(store)),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () => store.dispatch(RemoveAction()),
                  child: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        )));
  }
}
