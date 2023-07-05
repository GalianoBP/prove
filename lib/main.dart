import 'package:flutter/material.dart';
import 'package:flutter_tutorial_htmlit/icons.dart';

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
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        home: const DefaultTabController(
          length: 3,
          child: MyHomePage(title: 'Flutter Demo Hot Reload'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Widget> _elementi = [];

  //void sp() => {_elementi.add(const SizedBox(height: 25))};

  void _incrementCounter() {
    setState(() {
      _counter++;
      _elementi.add(_addcontainer());
      _elementi.add(const SizedBox(height: 25));
    });
  }

  Container _addcontainer() {
    String testo = (_counter % 2 == 0) ? "Papa" : "Mama";
    Color primcolor = (_counter % 2 == 0) ? Colors.cyanAccent : Colors.tealAccent;
    Color seccolor = (_counter % 2 == 0) ? Colors.cyan : Colors.teal;
    return _drugtabs(primcolor, seccolor, testo);
  }

  /*
  *  Ho realizzato una funzione che mi permettesse di creare i Container con alcune caratteristiche, questi saranno le tabs dei medicinali
  *
  *
  * */

  _drugtabs(primcolor, seccolor, testo) {
    return Container(
      width: 320,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          gradient: LinearGradient(
              colors: [primcolor, seccolor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(15), left: Radius.circular(15))),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Spacer(),
        const Column(children: [
          Text(
            'Terapia',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Text(
            'Dr Rossi',
            style: TextStyle(
              fontSize: 25,
            ),
          )
        ]),
        Spacer(),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(icon: Icon(Medicons.briefcase_medical), onPressed: () {}),
          IconButton(icon: Icon(Medicons.stethoscope), onPressed: () {}),
        ])
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 75,
          title:
              RichText(text: TextSpan(text: "Therapeasy", style: TextStyle(color: Colors.teal, fontSize: 40, fontFamily: 'VeganStyle'))),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
          ],
        ),
        body: SingleChildScrollView(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              //const SizedBox(width: 15),
              Column(
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _elementi),
                  TextButton(
                      onPressed: () => _incrementCounter(),
                      child: const Text("Aggiungi elemento"))
                ],
              )
            ])),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(icon: Icon(Medicons.notes_medical)),
            Tab(icon: Icon(Medicons.briefcase_medical)),
            Tab(icon: Icon(Medicons.stethoscope)),
          ],
        ));
  }
}
