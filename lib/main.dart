import 'package:flutter/material.dart';

import 'image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MytextPage(title: 'Flutter Demo text Page'),
    );
  }
}

class MytextPage extends StatefulWidget {
  const MytextPage({Key? key, String? title}) : super(key: key);

  @override
  State<MytextPage> createState() => _MytextPageState();
}

enum Place { audio, text, video }

class _MytextPageState extends State<MytextPage> {
  Place? _place;
  bool _textFieldVisible = false;
  bool _videoFieldVisible = false;
  bool _audioFieldVisible = false;

  void handleSelection(Place? value) {
    _place = value;
    // _textFieldVisible = value == Place.text;
    if (Place.text == _place) {
      setState(() {
        _textFieldVisible = value == Place.text;

        _textFieldVisible = true;
        _videoFieldVisible = false;
        _audioFieldVisible = false;
      });
    } else if (Place.audio == _place) {
      setState(() {
        _audioFieldVisible = value == Place.text;
        _audioFieldVisible = true;
        _textFieldVisible = false;
        _videoFieldVisible = false;
      });
    }

    if (Place.video == _place) {
      setState(() {
        _videoFieldVisible = value == Place.text;
        _videoFieldVisible = true;
        _audioFieldVisible = false;
        _textFieldVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: (Theme(
        data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.red, disabledColor: Colors.blue),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                RadioListTile(
                  title: Text(
                    'Text',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: Place.text,
                  groupValue: _place,
                  onChanged: handleSelection,
                ),
                if (_textFieldVisible)
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      filled: true,
                      hintText: 'Enter a Text term of Text',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                RadioListTile(
                  title: Text(
                    'Audio',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: Place.audio,
                  groupValue: _place,
                  onChanged: handleSelection,
                ),
                if (_audioFieldVisible)
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter a Text term of Audio',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                RadioListTile(
                  title: Text(
                    'Video',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: Place.video,
                  groupValue: _place,
                  onChanged: handleSelection,
                ),
                if (_videoFieldVisible)
                  ElevatedButton(onPressed: () {   Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage()),
                  ); },
                  child: Text('Add Video'),),
              ],
            ),
          ),
        ),
      )),
    );
  }
}