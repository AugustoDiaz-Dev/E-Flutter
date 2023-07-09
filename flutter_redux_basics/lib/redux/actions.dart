import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class AddAction {
  final int count;

  AddAction(this.count);
}

class RemoveAction {}

class SetTextAction {
  final String text;

  SetTextAction({required this.text});
}

class ResetTextAction {}

class GetImageAction {}

class LoadedImageAction {
  final Widget widget;

  LoadedImageAction(this.widget);
}

ThunkAction calcCountThunkAction = (Store store) async {
  compute(calc, 2000000000).then((value) => store.dispatch(AddAction(value)));
};

Future<int> calc(int count) async {
  int result = 0;
  for (var i = 0; i < count; ++i) {
    result++;
  }
  return result;
}

ThunkAction loadImageThunkAction = (Store store) async {
  store.dispatch(GetImageAction());
  _loadImage(
          'https://static3.tildacdn.com/tild3962-6631-4233-b438-343836656662/_.png')
      .then((image) => store.dispatch(LoadedImageAction(image)));
};

Future<Widget> _loadImage(String url) async {
  await Future.delayed(const Duration(seconds: 1));
  return Image.network(url);
}
