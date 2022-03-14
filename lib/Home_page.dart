import 'package:animation_wri/Second_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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

  double _size = 100;
  double _vert = 0;
  double _horiz = 0;
  void _incrementCounter() {
    setState(() {
      _size += 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                curve: Curves.bounceIn,
                duration: Duration(seconds: 1),
                width: _size,
                height: _size,
                color: Colors.blue,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _size -= 60;
                    });
                  },
                  child: Text('Make Smaller')),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                width: 350,
                height: 350,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                        curve: Curves.bounceIn,
                        top: _vert,
                        right: _horiz,
                        child: Icon(
                          Icons.forward,
                          size: 64,
                        ),
                        duration: Duration(seconds: 1)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _vert += 60;
                        });
                      },
                      child: Text('Vert')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _horiz += 60;
                        });
                      },
                      child: Text('Horiz')),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: Hero(
                  tag: 'kotak',
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.blueGrey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
