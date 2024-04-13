import 'package:flutter/material.dart';

class SimpleList extends StatelessWidget {
  final List<String> entries;


  const SimpleList({
    Key? key, required this.entries, //required this.index,
    }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Text('${entries[index]}');
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

      // final List<String> _array = [this.t1, this.t2, this.t3];
      // final int index = i + 1;
      // if (i.isOdd) return Divider();
      // //  if (index >=)
      // // print('');
      // return ListTile(title: Text(_array[i]));
//    ] )});
//   }
// }

// class SimpleListState extends State<SimpleList> {
//   final List<String> _array = ['0000','0001','0010'];

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(itemBuilder: (context, i) {
  //     final int index = i+1;
  //     if (index.isOdd) return Divider();
  //   //  if (index >=)
  //    // print('');
  //     return ListTile(title: Text(_array[i]));
  //   });
  // }}

  //Widget simpleList = ListView.builder(itemBuilder: itemBuilder)

  //@override
  //Widget build(BuildContext context) {
   // return simpleList;
 // }
//}