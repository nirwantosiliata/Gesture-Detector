import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan Gestur detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHOmePage(),
    );
  }
}

class MyHOmePage extends StatefulWidget {
  const MyHOmePage({super.key});

  @override
  State<MyHOmePage> createState() => _MyHOmePageState();
}

class _MyHOmePageState extends State<MyHOmePage> {
  final double boxSize = 150.0;
  int numTaps = 0;
  int numDoubleTaps = 0;
  int numLongPressTaps = 0;
  double posX = 0.0;
  double posY = 0.0;

  void center(BuildContext context) {
    posX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize / 2 - 50;

    setState(() {
      posX;
      posY;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (posX == 0) {
      center(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture detector'),
      ),
      body: Stack(children: [
        Positioned(
          left: posX,
          top: posY,
          child: GestureDetector(
            onTap: () {
              setState(() {
                numTaps++;
              });
            },
            onDoubleTap: () {
              setState(() {
                numDoubleTaps++;
              });
            },
            onLongPress: () {
              setState(() {
                numLongPressTaps++;
              });
            },
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                double deltaX = details.delta.dx;
                double deltaY = details.delta.dy;
                posX += deltaX;
                posY += deltaY;
              });
            },
            child: Container(
              height: boxSize,
              width: boxSize,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        padding: const EdgeInsets.all(16),
        child: Text(
          'Taps: $numTaps - Double Taps: $numDoubleTaps - Long Press: $numLongPressTaps',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
