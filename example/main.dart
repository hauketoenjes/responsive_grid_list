import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Grid List Demo',
      debugShowCheckedModeBanner: false,
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Generate a list of 100 cards containing a text widget with it's index
    // and render it using a ResponsiveGridList

    return Scaffold(
      appBar: AppBar(title: Text('Demo')),
      body: ResponsiveGridList(
        minItemWidth: 100,
        children: List.generate(
          100,
          (index) => Card(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                '$index',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
