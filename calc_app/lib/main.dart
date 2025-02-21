import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var operators= ['/', '*', '-', '+'];
  var row2 = ['7', '8', '9'];
  var row3 = ['4', '5', '6'];
  var row4 = ['1', '2', '3'];
  var row5 = ['0', 'clear', '=', '/'];

  List currentCalc = [];
  String calcDisplay = '0';

  bool _calcDisplayContainsOperator(){
    if(calcDisplay.contains('+') || calcDisplay.contains('-') || calcDisplay.contains('*') || calcDisplay.contains('/')){
      return true;
    } else {
      return false;
    }
  }
  
  void _clearCurrentCalc() {
    setState(() {
      currentCalc = [];
      calcDisplay = '0';
    });
  }

  void _handleOperator(String operator){
    setState(() {
      if(calcDisplay == '0' || _calcDisplayContainsOperator()){
        return;
      } else {
        currentCalc.add(calcDisplay);
        currentCalc.add(operator);
        calcDisplay = operator;
        print(currentCalc);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
