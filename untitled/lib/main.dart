import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab4',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        //),
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        //useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Общежития КубГАУ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool t = false;
int k = 0;

class _MyHomePageState extends State<MyHomePage> {

  Widget _infoRow() {
    return Center(
        child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Общежитие №20',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          Text('Краснодар, ул. Калинина, 13',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(width: 98),
                  Container(
                  child: Row(
                    children: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            //t = !t;
                          if (t == true) {
   t = false; --k;};
   if (t==false) { t = true; ++k;};
                          //}
    });
                          //});
                        },),
                      Text('$k',
                      ),
                  ],
                  ),
                  )
                ]
            )
        )
    );
  }

  Widget _iconsRow() {
    return Center(
        child: Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.phone, color: Colors.green),
                    onPressed: () {
                      Call() async {
                        var url = Uri.parse("tel:9776765434");
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Не удалось набрать $url';
                        }
                      }
                    },
                  ),
                  Text('ПОЗВОНИТЬ',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.navigation, color: Colors.green),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Внимание"),
                          content: const Text("До общежития на машине не территории вуза проехать нельзя."),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                color: Colors.green,
                                padding: const EdgeInsets.all(14),
                                child: const Text("ОК"),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Text('МАРШРУТ',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.green),
                    onPressed: () {
                      Share.share('https://kubsau.ru/', subject: 'Общежития КубГАУ');
                    },
                  ),
                  Text('ПОДЕЛИТЬСЯ',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              )
            ]
        )
        )
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(widget.title),
        ),
        body: Center(
                child: SingleChildScrollView(
                    child: Container(
                        child: Column(
                            children: <Widget>[
                            Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Image(image: AssetImage('assets/place.jpg')),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  _infoRow(),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  _iconsRow(),//('Share')]),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    width: 400,
                                    child: Text('Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.'),//)
                                  )
                                ]
                            )
                            ]
                        )
                    )
                )
        )
    );
  }
}
