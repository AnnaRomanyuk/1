import 'package:flutter/material.dart';
import 'simpleList.dart';
import 'InfiniteList_1.dart';
import 'InfiniteList_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: FirstPage(title: 'Простой список'),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: SimpleList(entries: ['0000', '0001', '0010']),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const SecondPage(title: 'Бесконечный список строк');
          }));
        },
        child: const Text('Далее'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(widget.title),
        ),
        body: InfiniteList1(),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const FirstPage(title: 'Простой список');
                    }
                    )
                    );
                  },
                  child: const Text('Назад'),
                  heroTag: null,
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const ThirdPage(title: 'Бесконечный список (степень)');
                    }
                    )
                    );
                  },
                  child: const Text('Далее'),
                  heroTag: null,
                )
              ])),
      );
  }
}


class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: InfiniteList2(),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const SecondPage(title: 'Бесконечный список строк');
                    }
                    )
                    );
                  },
                  child: const Text('Назад'),
                  heroTag: null,
                ),
                FloatingActionButton(
                  onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FirstPage(title: 'Простой список');
                }
                )
                );
              },
              child: const Text('Начало'),
              heroTag: null,
            )
          ])),
    );
  }
}