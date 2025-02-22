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

  void _handleNum(String num){
    setState(() {
      if(calcDisplay == '0' || calcDisplay.contains('.')){
        calcDisplay = num;
      } else if(_calcDisplayContainsOperator() && currentCalc.length == 2){
        calcDisplay = num;
      } else {
        calcDisplay += num;
      }
    });
  }

    double _calculation(){
    if(currentCalc[1] == '+'){
      double sum = double.parse(currentCalc[0]) + double.parse(calcDisplay);
      return sum;
    } else if(currentCalc[1] == '-'){
      double difference = double.parse(currentCalc[0]) - double.parse(calcDisplay);
      return difference;
    } else if(currentCalc[1] == '*'){
      double product = double.parse(currentCalc[0]) * double.parse(calcDisplay);
      return product;
    } else {
      double quotient = double.parse(currentCalc[0]) / double.parse(calcDisplay);
      return quotient;
    }
  }

  void _handleEquals(){
    setState(() {
      if(_calcDisplayContainsOperator()){
        calcDisplay = currentCalc[0];
        currentCalc.clear();
      } else if(currentCalc.isEmpty || calcDisplay == '0'){
        return;
      } else {
        calcDisplay = _calculation().toString();
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
            Center(
              child: Container(
                height: 30,
                width: 250,
                color: Colors.grey,
                child: Align(alignment: Alignment.centerRight, child: Text(calcDisplay),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(var num in row2) TextButton(onPressed: () => _handleNum(num), style: TextButton.styleFrom(backgroundColor: Colors.orange), child: Text(num)),
                TextButton(onPressed: () => _handleOperator('+'), style: TextButton.styleFrom(backgroundColor: Colors.blueAccent), child: Text('+'),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(var num in row3) TextButton(onPressed: () => _handleNum(num), style: TextButton.styleFrom(backgroundColor: Colors.orange), child: Text(num)),
                TextButton(onPressed: () => _handleOperator('-'), style: TextButton.styleFrom(backgroundColor: Colors.blueAccent), child: Text('-'),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(var num in row4) TextButton(onPressed: () => _handleNum(num), style: TextButton.styleFrom(backgroundColor: Colors.orange), child: Text(num)),
                TextButton(onPressed: () => _handleOperator('*'), style: TextButton.styleFrom(backgroundColor: Colors.blueAccent), child: Text('*'),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () => _handleNum('0'), style: TextButton.styleFrom(backgroundColor: Colors.orange), child: Text('0'),),
                TextButton(onPressed: () => _clearCurrentCalc(), style: TextButton.styleFrom(backgroundColor: Colors.red), child: Text('clear')),
                TextButton(onPressed: () => _handleEquals(), style: TextButton.styleFrom(backgroundColor: Colors.green), child: Text('=')),
                TextButton(onPressed: () => _handleOperator('/'), style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),child: Text('/'))
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}