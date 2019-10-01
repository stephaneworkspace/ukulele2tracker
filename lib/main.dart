import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:positioned_tap_detector/positioned_tap_detector.dart';
import 'package:flutter_midi/flutter_midi.dart';
// import 'package:vibrate/vibrate.dart';
import 'uku_tabs.dart';
import 'uku_hitbox.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Ukulele chord',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Ukulele chord '),
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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  initState() {
    _loadSoundFont();
    super.initState();
  }


  void _loadSoundFont() async {
    FlutterMidi.unmute();
    /*rootBundle.load('assets/sounds/Piano.sf2').then((sf2) {
      FlutterMidi.prepare(sf2: sf2, name: 'Piano.sf2');
    });*/
    rootBundle.load('assets/sounds/Piano.sf2').then((sf2) {
      FlutterMidi.prepare(sf2: sf2, name: 'Piano.sf2');
    });
    /*rootBundle.load('assets/sounds/Bachata_guitar.sf2').then((sf2) {
      FlutterMidi.prepare(sf2: sf2, name: 'Bachata_guitar.sf2');
    });*/

    _bottomText = '${_intToNoteString(Note.g, 48)} ${_intToNoteString(Note.c, 48)} ${_intToNoteString(Note.e, 48)} ${_intToNoteString(Note.a, 48)}';
  }
  
  List _midi = [];

  int _counter = 0;

  final _startOctave = 48;

  void _playChord() async {
    // This call to setState tells the Flutter framework that something has
    // changed in this State, which causes it to rerun the build method below
    // so that the display can reflect the updated values. If we changed
    // _counter without calling setState(), then the build method would not be
    // called again, and so nothing would appear to happen.
    setState(() {
      _counter++;
      // _position = 'Begin';
      // 0 - C0  / 1 - C# / 2 - D0  / 3 - D#0 / 4  - E0  / 5 - F0 
      // 6 - F#0 / 7 - G0 / 8 - G#0 / 9 - A0  / 10 - A#0 / 11 - B0

      // 0 - C0
      // 12 - C1
      // 24 - C2
      // 36 - C3
      // 48 - C4
      // 60 - C5
      _midi = [];
      // G C E A
      _midi.add(_noteToInt(Note.g, _ligne[0], _swPlayOctave));
      _midi.add(_noteToInt(Note.c, _ligne[1], _swPlayOctave)); 
      _midi.add(_noteToInt(Note.e, _ligne[2], _swPlayOctave)); 
      _midi.add(_noteToInt(Note.a, _ligne[3], _swPlayOctave)); 
      for (int ukuString in _midi) {
        FlutterMidi.playMidiNote(midi: ukuString);
        Timer(Duration(seconds: 1), () {
          setState(() {
            //_position = 'End';
            FlutterMidi.stopMidiNote(midi: ukuString);
          });
        });
      }
    });
  }

/* http://blog.sethladd.com/2011/12/lists-and-arrays-in-dart.html
*/

  int _noteToInt(Note note, int add, int octave) {
    return (octave * 12) + (note.index + 1) + add;
  }

  String _intToNoteString(Note offSet, int noteMidi) {
    int octave = (noteMidi / 12).round();
    int note = noteMidi - (octave * 12) + (offSet.index);
    String noteString = '';
    switch (note) {
      case 0:
        noteString = 'C';
        break;
      case 1:
        noteString = 'C#';
        break;
      case 2:
        noteString = 'D';
        break;
      case 3:
        noteString = 'D#';
        break;
      case 4:
        noteString = 'E';
        break;
      case 5:
        noteString = 'F';
        break;
      case 6:
        noteString = 'F#';
        break;
      case 7:
        noteString = 'G';
        break;
      case 8:
        noteString = 'G#';
        break;
      case 9:
        noteString = 'A';
        break;
      case 10:
        noteString = 'A#';
        break;
      case 11:
        noteString = 'B';
        break;
      case 12:
        noteString = 'C';
        break;
      case 13:
        noteString = 'C#';
        break;
      case 14:
        noteString = 'D';
        break;
      case 15:
        noteString = 'D#';
        break;
      case 16:
        noteString = 'E';
        break;
      case 17:
        noteString = 'F';
        break;
      case 18:
        noteString = 'F#';
        break;
      case 19:
        noteString = 'G';
        break;
      case 20:
        noteString = 'G#';
        break;
      case 21:
        noteString = 'A';
        break;
      case 22:
        noteString = 'A#';
        break;
      case 23:
        noteString = 'B';
        break;
    } 
    return '$noteString$octave';
  }

  String _bottomText = '';
  List _ligne = [
    0, 0, 0, 0
  ];

  void _handleTap(String gesture, TapPosition position) {
    setState(() {
      int x = UkuHitBox().detectColumn(position.relative.dx);
      int y = UkuHitBox().detectLine(position.relative.dy);
      if (x > 0) {
        _ligne[x - 1] = y;
      }
      _bottomText = '${_intToNoteString(Note.g, _ligne[0] + _startOctave)} ${_intToNoteString(Note.c, _ligne[1] + _startOctave)} ${_intToNoteString(Note.e, _ligne[2] + _startOctave)} ${_intToNoteString(Note.a, _ligne[3] + _startOctave)}';
      //_bottomText = '${UkuHitBox().detectColumn(position.relative.dx)} | ${UkuHitBox().detectLine(position.relative.dy)}';
      //_bottomText = '$_swPrint -> $gesture: Global: ${position.global}, Relative ${position.relative}'; // relative is ok
    }); // setState for refresh form
    // _setPrint();
  }

  // Pour le moment je n'ouvre pas une nouvelle vue
  void _toHelp(context) {
    setState(() {
      _bottomText = 'Ukulele helper by Stéphane Bressani';
    });
  }

/*
  // Pour le moment je n'ouvre pas une nouvelle vue
  void _toSettings(context) {
    setState(() {
      _bottomText = 'Settings';
    });
  }*/

  /*
  bool _swPrint = false;
  void _setPrint() {
    setState(() {
      _swPrint ? _swPrint = false : _swPrint = true;
    });
  }*/

  int _swPlayOctave = 4;
  void _toSwPlayOctave(context) async {
    setState(() {
      (_swPlayOctave == 5) ? _swPlayOctave = 2 : _swPlayOctave++;
    });
  }
  /*
  // Pour le moment je n'ouvre pas une nouvelle vue
  void _toDetectDown(tapDownDetail) {
    setState(() {
      _position = 'Down';
    });
  }

  void _toDetectCancel() {
    setState(() {
      _position = 'Cancel';
    });
  }*/

  @override
  Widget build(BuildContext context) {
    List<Widget> menu = <Widget>[
      new IconButton(
        icon: new Icon(Icons.tonality),
        tooltip: 'Change play octave',
        onPressed: () => _toSwPlayOctave(context)
      ),
      /*
      new IconButton(
        icon: new Icon(Icons.settings),
        tooltip: 'Settings',
        onPressed: () => _toSettings(context)
      ),*/
      new IconButton(
        icon: new Icon(Icons.help),
        tooltip: 'Help',
        onPressed: () => _toHelp(context)
      )
    ];

/*
    Widget subtitle = new Container(
      child: new Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.green[300],
              Colors.green[100],
            ],
          ),
        ),
        padding: new EdgeInsets.all(8.0),
        child: new Center(
          child: new Text('Veuillez insérez la position des cordes à l\'écran'),
        )
      )
    );*/

    Widget middleSection = new Expanded(
      child: new Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.green[600],
              Colors.green[400],
              Colors.green[300],
              Colors.green[100],
            ],
          ),
        ),
        //padding: new EdgeInsets.all(8.0),
        height: 48.0, // https://cogitas.net/flutter-ui-code-tutorial-mastering-row-column/ ???
        child: new Align(
          alignment: FractionalOffset.center,
          child: PositionedTapDetector(
            onTap: (position) => _handleTap('Single tap', position),
            onDoubleTap: (position) => _handleTap('Double tap', position),
            onLongPress: (position) => _handleTap('Long press', position),
            doubleTapDelay: Duration(milliseconds: 500),
            child: new CustomPaint(
              size: Size(300, 530),
              painter: new UkuTabs(_ligne)
            ),
          )
        )
      )
    );

    Widget bottomBanner = new Container(
      padding: new EdgeInsets.all(8.0),
      color: Colors.black,
      height: 48.0,
      child: new Center(
        child: new Text('$_bottomText',
          style: new TextStyle(color: Colors.white)
        ),
      ),
    );

    Widget body = new Column(
      // This makes eache child fill the full width of the screen
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // subtitle,
        middleSection,
        bottomBanner
      ]
    );

    return new Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title),
        title: new Text(widget.title + '$_counter'),
        actions: menu,
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: body,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playChord,
        tooltip: 'Play',
        child: Icon(Icons.play_arrow),
        /*child: Ink.image(
        //  image: AssetImage('assets/test.png'),
        //  fit: BoxFit.cover,
        //  width: 50.0,
        //  height: 50.0,
          child: InkWell(
            onTap: () {},
            onTapDown: _toDetectDown,
            onTapCancel: _toDetectCancel,
            child: new Icon(Icons.play_arrow),
          )
        //)*/
      ),
    );
  }
}
/*
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title),
        title: new Text(widget.title + '$_counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // center
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            /*Expanded(
              child: Align(
                alignment: FractionalOffset.topCenter,
                child: PositionedTapDetector(
                  onTap: (position) => _handleTap('Single tap', position),
                  onDoubleTap: (position) => _handleTap('Double tap', position),
                  onLongPress: (position) => _handleTap('Long press', position),
                  doubleTapDelay: Duration(milliseconds: 500),
                  child: Image.asset(
                    'assets/test.png',
                    fit: BoxFit.fill,
                    width: 320.0,
                    height: 320.0,
                  )
                )
              ) 
            ),*/
            Expanded(
              child: Align(
                alignment: FractionalOffset.topCenter,
                child: PositionedTapDetector(
                  onTap: (position) => _handleTap('Single tap', position),
                  onDoubleTap: (position) => _handleTap('Double tap', position),
                  onLongPress: (position) => _handleTap('Long press', position),
                  doubleTapDelay: Duration(milliseconds: 500),
                  child: new CustomPaint(
                    size: Size(300, 700),
                    painter: new UkuTabs()
                  ),
                )
              )
            ), 
            Expanded(
              child: Align(
                alignment: FractionalOffset.topCenter,
                child: new Text(_position),
              )
            ),
          ],
        ),
        //)
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        /*child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),*/
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
// https://flutterstudio.app

enum Note {
  c,
  cD,
  d,
  dD,
  e,
  f,
  fD,
  g,
  gD,
  a,
  aD,
  b
}