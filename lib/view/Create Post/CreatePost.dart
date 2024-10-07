import 'dart:io';
import 'package:green_master/repository/Post%20Operation.dart';
import 'package:green_master/res/widget/Button.dart';
import 'package:green_master/view/Buyer%20and%20Seller/HomeScreen.dart';
import 'package:green_master/view/Seller/HomeScreen.dart';
import 'package:record/record.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Posting extends StatefulWidget {
  const Posting({super.key});

  @override
  State<Posting> createState() => _PostingState();
}

class _PostingState extends State<Posting> {
  File? _image;
  final Myimage = ImagePicker();

  late int roleId;
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  String audioPath = "";
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  PostOP p = PostOP();
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioRecord = Record();
    GetroleId();
  }

  void dispose() {
    super.dispose();
    audioRecord.dispose();
    audioPlayer.dispose();
  }

  Future<void> GetroleId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int storedRoleId = prefs.getInt('roleId') ?? -1;
    setState(() {
      roleId = storedRoleId;
    });
  }

  var json = {
    2: 'S',
    3: 'S',
    4: 'S',
    5: 'S',
    6: 'S',
    7: 'S',
    8: 'BS',
    9: 'BS',
    10: 'BS'
  };
  @override
  bool playing = false;
  Future<void> startRecording() async {
    try {
      print("START RECODING+++++++++++++++++++++++++++++++++++++++++++++++++");
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        setState(() {
          isRecording = true;
        });
      }
    } catch (e, stackTrace) {
      print(
          "START RECODING+++++++++++++++++++++${e}++++++++++${stackTrace}+++++++++++++++++");
    }
  }

  Future<void> stopRecording() async {
    try {
      print("STOP RECODING+++++++++++++++++++++++++++++++++++++++++++++++++");
      String? path = await audioRecord.stop();
      setState(() {
        var recoding_now = false;
        isRecording = false;
        audioPath = path!;
        print('Audiopath ${audioPath}');
      });
    } catch (e) {
      print(
          "STOP RECODING+++++++++++++++++++++${e}+++++++++++++++++++++++++++");
    }
  }

  /*Future<void> stopRecording() async {
  try {
    print("STOP RECODING+++++++++++++++++++++++++++++++++++++++++++++++++");
    String? m4aPath = await audioRecord.stop();
    setState(() {
      var recoding_now = false;
      isRecording = false;
    });

    if (m4aPath != null) {
      final mp3Path = '${m4aPath.replaceAll('.m4a', '.mp3')}'; // Create output MP3 path

      await FFmpegKit.execute(
        '-i $m4aPath -c:a libmp3lame $mp3Path', // FFmpeg command for conversion
      );

      print('Converted audio to MP3: $mp3Path');
      audioPath = mp3Path; // Update audioPath for playback
    }
    else{}
  } catch (e) {
    print(
      "STOP RECODING+++++++++++++++++++++${e}+++++++++++++++++++++++++++");}

}*/

  Future<void> playRecording() async {
    try {
      playing = true;
      setState(() {});

      print("AUDIO PLAYING+++++++++++++++++++++++++++++++++++++++++++++++++");
      Source urlSource = UrlSource(audioPath);
      await audioPlayer.play(urlSource);
      // Add an event listener to be notified when the audio playback completes
      audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
        if (state == PlayerState.completed) {
          playing = false;

          print(
              "AUDIO PLAYING ENDED+++++++++++++++++++++++++++++++++++++++++++++++++");
          setState(() {});
        }
      });
    } catch (e) {
      print(
          "AUDIO PLAYING++++++++++++++++++++++++${e}+++++++++++++++++++++++++");
    }
  }

  Future<void> pauseRecording() async {
    try {
      playing = false;

      print("AUDIO PAUSED+++++++++++++++++++++++++++++++++++++++++++++++++");

      await audioPlayer.pause();
      setState(() {});
      //print('Hive Playing Recording ${voiceRecordingsBox.values.cast<String>().toList().toString()}');
    } catch (e) {
      print(
          "AUDIO PAUSED++++++++++++++++++++++++${e}+++++++++++++++++++++++++");
    }
  }

  // Future<String> writeFile(String voice) async {
  //   Directory? tempDir = Directory("/storage/emulated/0/Download"); 

  //   await Directory(tempDir.path).create(recursive: true);
  //   File fileNew = File('${tempDir.path}/voice.m4a');
  //   fileNew.copy(voice);
  //   return fileNew.path;
  // }

   Future getImage() async {
     final pickedFile = await Myimage.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
         _image = File(pickedFile.path);
         print(_image!.path);
       } else {
         print('No image selected.');
       }
     });
   }

  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 10),
          child: ListView(
            children: [
              SizedBox(height: h * 0.04),
              Text(
                'Title',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: h * 0.0099,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Container(
                  height: 50,
                  width: (w > 500) ? h / 2 : h / 2.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black12),
                  child: TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: 20, top: 12, bottom: 12),
                      hintText: 'Title of your post?',

                      // Set the border to none to remove the outline border
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: h * 0.015),
              Text(
                'Image',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: h * 0.0099,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Container(
                  height: h / 3,
                  width: h / 3.5,
                  child: (_image == null)
                      ? GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image_outlined,
                                  color: Colors.black54,
                                  size: 17,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Select one image',
                                )
                              ],
                            ),
                          ))
                      : Image.file(
                          _image!,
                          fit: BoxFit.fill,
                        ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.75)),
                ),
              ),
              SizedBox(
                height: h * 0.015,
              ),
              Text(
                'Audio Message',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: h * 0.0099,
              ),
              ListTile(
                title: Text(
                  isRecording ? 'Recording...' : 'Press to start recording',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: IconButton(
                  icon: !playing
                      ? Icon(Icons.play_circle, color: Colors.green, size: 30)
                      : Icon(Icons.pause_circle, color: Colors.green, size: 30),
                  onPressed: !playing ? playRecording : pauseRecording,
                ),
                leading: IconButton(
                  icon: Icon(isRecording ? Icons.stop : Icons.mic),
                  onPressed: isRecording ? stopRecording : startRecording,
                  color: Colors.red,
                  iconSize: 30.0,
                ),
              ),
              SizedBox(height: h * 0.015),
              Text(
                'Description',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: h * 0.0099,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Container(
                  height: h / 2,
                  width: (w > 500) ? h / 2 : h / 2.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black12),
                  child: TextFormField(
                    controller: desc,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: 20, top: 12, bottom: 12),
                      hintText: 'Description of your post?',

                      // Set the border to none to remove the outline border
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.025,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () async {
                    // file = File(audioPath);
                   // print('Audio: $audioPath');
                   // String path = await writeFile(audioPath);
                    var check = await p.sentPost(
                      title.text,
                      desc.text,
                      _image!.path,
                      null,
                    );
                    if (check) {
                      if (json[roleId] == 'S') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Seller_Home_Screen();
                        }));
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BS_HomeScreen();
                        }));
                      }
                    } else {
                      print('Post was not created');
                    }
                  },
                  child: Button(title: 'Create', h: h, w: w),
                ),
              ),
              SizedBox(
                height: h * 0.022,
              )
            ],
          ),
        ),
      ),
    );
  }
}
