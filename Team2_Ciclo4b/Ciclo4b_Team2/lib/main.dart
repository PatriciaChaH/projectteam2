import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'CONVERSOR DE MONEDAS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class calculadora {
  final titulo;
  final color;
  final icono;

  calculadora(this.titulo, this.color, this.icono);
}

final textOrigen = TextEditingController();
final textDestino = TextEditingController();

String opcion1 = "USD";
String opcion2 = "USD";

List<DropdownMenuItem<String>> moneda = <DropdownMenuItem<String>>[
  DropdownMenuItem(value: "USD", child: Text("USD")),
  DropdownMenuItem(value: "EUR", child: Text("EUR")),
  DropdownMenuItem(value: "COP", child: Text("COP")),
];

List<calculadora> cal = <calculadora>[
  calculadora("9", Colors.amber[100], Icon(Icons.abc)),
  calculadora("8", Colors.amber[100], Icon(Icons.abc)),
  calculadora("7", Colors.amber[100], Icon(Icons.abc)),
  calculadora("6", Colors.amber[100], Icon(Icons.abc)),
  calculadora("5", Colors.amber[100], Icon(Icons.abc)),
  calculadora("4", Colors.amber[100], Icon(Icons.abc)),
  calculadora("3", Colors.amber[100], Icon(Icons.abc)),
  calculadora("2", Colors.amber[100], Icon(Icons.abc)),
  calculadora("1", Colors.amber[100], Icon(Icons.abc)),
  calculadora("0", Colors.amber[100], Icon(Icons.abc)),
  calculadora(
      "Limpiar",
      Colors.blue[100],
      Icon(
        CupertinoIcons.paintbrush,
        size: 45,
        color: Colors.blueGrey,
      )),
  calculadora(
      "Calcular",
      Colors.deepPurple[100],
      Icon(
        CupertinoIcons.equal,
        color: Colors.blueGrey,
        size: 45,
      )),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Origen : "),
                  DropdownButton(
                      value: opcion1,
                      items: moneda,
                      onChanged: (String? X) {
                        setState(() {
                          opcion1 = X.toString();
                        });
                      }),
                  Text("Destino : "),
                  DropdownButton(
                      value: opcion2,
                      items: moneda,
                      onChanged: (String? X) {
                        setState(() {
                          opcion2 = X.toString();
                        });
                      }),
                ],
              ),
              TextField(
                controller: textOrigen,
                decoration: InputDecoration(
                    labelText: "Moneda origen",
                    hintText: "0",
                    icon: Icon(
                      CupertinoIcons.money_dollar_circle_fill,
                      size: 30,
                      color: Colors.blue,
                    )),
              ),
              TextField(
                controller: textDestino,
                decoration: InputDecoration(
                    labelText: "Moneda destino",
                    hintText: "0",
                    icon: Icon(
                      CupertinoIcons.money_dollar_circle_fill,
                      size: 30,
                      color: Colors.green,
                    )),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: cal.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: cal[index].color,
                      child: ListTile(
                        title: Center(
                          child: index > 9
                              ? cal[index].icono
                              : Text(
                                  cal[index].titulo,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                        ),
                        onTap: () {
                          if (index == 10) {
                            textOrigen.text = "";
                          } else if (index < 10) {
                            textOrigen.text =
                                textOrigen.text + cal[index].titulo;
                          } else {
                            if (opcion1 == "USD" && opcion2 == "COP") {
                              textDestino.text =
                                  (double.parse(textOrigen.text) * 5091.76)
                                      .toString();
                            } else if (opcion1 == "COP" && opcion2 == "USD") {
                              textDestino.text =
                                  (double.parse(textOrigen.text) / 5091.76)
                                      .toString();
                            } else if (opcion1 == "EUR" && opcion2 == "COP") {
                              textDestino.text =
                                  (double.parse(textOrigen.text) * 5044)
                                      .toString();
                            } else if (opcion1 == "COP" && opcion2 == "EUR") {
                              textDestino.text =
                                  (double.parse(textOrigen.text) / 5044)
                                      .toString();
                            } else if (opcion1 == "USD" && opcion2 == "EUR") {
                              textDestino.text =
                                  (double.parse(textOrigen.text) * 1.00334)
                                      .toString();
                            } else if (opcion1 == "EUR" && opcion2 == "USD") {
                              textDestino.text =
                                  (double.parse(textOrigen.text) * 0.996672)
                                      .toString();
                            } else {
                              textDestino.text = textOrigen.text;
                            }
                          }

                          print(cal[index].titulo);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
