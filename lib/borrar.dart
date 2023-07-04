import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final Widget goodJob = const Text('أحسنت!');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title)
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Text('لقد ضغطت على الزر عدة مرات:'),

            ValueListenableBuilder(

              builder: (BuildContext context, int value, Widget? child) {
               
                return Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('$value'),
                    
                  ],
                );

              },
              valueListenable: _counter,

              child: goodJob,

            )

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () => _counter.value += 1,
      ),
    );
  }
}