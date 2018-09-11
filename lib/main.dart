import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Super Statistics App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _playCounter = 0;
  int _pauseCounter = 0;
  int _stopCounter = 0;
  String _chartType = "Bar Chart";

  void _incrementPlayCounter() {
        setState(() {
        _playCounter++;
      });
  }

   void _incrementPauseCounter() {
        setState(() {
        _pauseCounter++;
      });
  }

   void _incrementStopCounter() {
        setState(() {
        _stopCounter++;
      });
  }

  List<Series<Clicks, String>> _buildSeriesList(){
    final data = [
      new Clicks('Play', _playCounter, Colors.green),
      new Clicks('Pause', _pauseCounter, Colors.blue),
      new Clicks('Stop', _stopCounter, Colors.red)
    ];

    return [
      new Series<Clicks, String>(
        id: 'Clicks',
        colorFn: (Clicks click, __) => click.color,
        domainFn: (Clicks click, _) => click.name,
        measureFn: (Clicks click, _) => click.clicks,
        labelAccessorFn: (Clicks click, _) => click.clicks.toString(),
        insideLabelStyleAccessorFn: (Clicks click, _) {
          return new TextStyleSpec(color: Color(r:0,g:0,b:0));
        },
        data: data,
        
      )
    ];
  }

  BarChart _barChart(){
    return new BarChart(
      _buildSeriesList(),
      animate: true,
    );
  }

  PieChart _pieChart(){
    return new PieChart(
      _buildSeriesList(),
      animate: true,
    );
  }

  Padding _customChart(){
    if(_chartType == "Bar Chart")
      return new Padding(
        padding: EdgeInsets.all(32.0),
        child: new SizedBox(child: _barChart(), height: 300.0)
      );
    else
      return new Padding(
        padding: EdgeInsets.all(32.0),
        child: new SizedBox(child: _pieChart(), height: 300.0)
      );
  }

  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new DropdownButton<String>(
              items: <String>['Bar Chart','Pie Chart'].map((String value){
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (value){
                if(value != null)
                  setState((){
                    _chartType = value;
                  });
              },
              value: _chartType,
              style: new TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
              elevation: 24,
            ),
            _customChart(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: _incrementPlayCounter,
                  child: new Icon(Icons.play_arrow),
                  heroTag: 'playCounter',
                ),
                SizedBox(width:20.0),
                new FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: _incrementPauseCounter,
                  child: new Icon(Icons.pause),
                  heroTag: 'pauseCounter',
                ),
                SizedBox(width:20.0),
                new FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: _incrementStopCounter,
                  child: new Icon(Icons.stop),
                  heroTag: 'stopCounter',
                )
              ]
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Clicks{
  final String name;
  final int clicks;
  final Color color;

  Clicks(this.name, this.clicks, MaterialColor color)
    : this.color = new Color(r: color.red, g: color.green, b: color.blue, a: color.alpha);
}