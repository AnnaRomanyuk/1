import 'package:flutter/material.dart';

class InfiniteList1 extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return new Text('строка $index');
      },
   );
  }
}
