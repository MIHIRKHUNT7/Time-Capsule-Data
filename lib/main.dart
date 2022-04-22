import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

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

  void handleSelection(Place? value) {
    setState(() {
      _place = value;
      _textFieldVisible = value == Place.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              RadioListTile(
                title: Text('Text'),
                value: Place.text,
                groupValue: _place,
                onChanged: handleSelection,
              ),
              if (_textFieldVisible)
                 TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a Text term',
                  ),
                ),
              RadioListTile(
                title: Text('Audio'),
                value: Place.audio,
                groupValue: _place,
                onChanged: handleSelection,
              ),
              RadioListTile(
                title: Text('Video'),
                value: Place.video,
                groupValue: _place,
                onChanged: handleSelection,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
