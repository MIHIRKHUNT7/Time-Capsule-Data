import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  File? _video;

  ImagePicker picker = ImagePicker();

  late VideoPlayerController _videoPlayerController;

  _pickImageFromGallery() async {
    PickedFile? pickedFile = await picker.getImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 200);

    File image = File(pickedFile!.path);

    setState(() {
      _image = image;
    });
  }

  _pickVideo() async {
    PickedFile? pickedFile = await picker.getVideo(
      source: ImageSource.gallery,
    );

    _video = File(pickedFile!.path);

    _videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
               /* if (_image != null)
                  Image.file(
                    _image!,
                    width: 100,
                  )
                else
                  Text(
                    "Click on Pick Image to select an Image",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                RaisedButton(
                  onPressed: () {
                    _pickImageFromGallery();
                  },
                  child: Text("Pick Image From Gallery"),
                ),
                SizedBox(
                  height: 16.0,
                ),*/
                if (_video != null)
                  _videoPlayerController.value.isInitialized
                      ? Container(
                    width: 100,
                        child: AspectRatio(
                            aspectRatio: _videoPlayerController.value.aspectRatio,
                            child: Container(
                              child: VideoPlayer(_videoPlayerController),
                              width: 100,
                            ),
                          ),
                      )
                      : Container()
                else
                  Text(
                    "Click on Pick Video to select video",
                    style: TextStyle(fontSize: 16.0, color: Colors.white60),
                  ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    _pickVideo();
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
