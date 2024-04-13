import 'package:flutter/material.dart';

class InfiniteList2 extends StatelessWidget {

  List<int> _array = [];

  @override

  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context, i){
      print('num $i : нечетное = ${i.isOdd}');
      if(i.isOdd) return new Divider();
      final int index = i ~/ 2;
      print('index $index');
      print('length ${_array.length}');
      if (index >= _array.length) _array.addAll([index, index + 1, index + 2]);
      return new ListTile(title: new Text('2 ^ ${_array[index]} = ${index * index}'));
    });
  }
}