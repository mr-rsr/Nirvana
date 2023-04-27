// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nirvana/src/res/colors.dart';
import 'package:nirvana/src/views/songListScreen.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadSong extends StatefulWidget {
  const UploadSong({super.key});

  @override
  State<UploadSong> createState() => _UploadSongState();
}

class _UploadSongState extends State<UploadSong> {
  final _song = TextEditingController();
  bool _songValidate = false;
  final _artist = TextEditingController();
  bool _artistValidate = false;
  final _image = TextEditingController();
  bool _imageValidate = false;

  @override
  void dispose() {
    _song.dispose();
    _artist.dispose();
    _image.dispose();
    super.dispose();
  }

  File? image;
  late String imagePath;
  late String image_down_url;
  void selectImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);
    image = File(result!.files.single.path!);
    setState(() {
      image = image;
      imagePath = basename(image!.path);
      uploadImageFile(image!.readAsBytesSync(), imagePath);
    });
  }

  Future<String> uploadImageFile(List<int> afile, String path) async {
    final ref = FirebaseStorage.instance.ref().child(path);
    final uploadTask = ref.putData(Uint8List.fromList(afile));
    final snapshot = await uploadTask;
    final downloadUrl = await snapshot.ref.getDownloadURL();
    image_down_url = downloadUrl;
    return downloadUrl;
  }

  // ignore: non_constant_identifier_names
  File? Song;
  // ignore: prefer_typing_uninitialized_variables
  late String SongPath;
  // ignore: prefer_typing_uninitialized_variables
  var song_down_url;

  final firestoreinstance = FirebaseFirestore.instance;

  void songSelect() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.audio, allowMultiple: false);
    Song = File(result!.files.single.path!);
    setState(() {
      Song = Song;
      SongPath = basename(Song!.path);
      songUpload(Song!.readAsBytesSync(), SongPath);
    });
  }

//Uint8List.fromList(list);
  Future<String> songUpload(List<int> afile, String path) async {
    final ref = FirebaseStorage.instance.ref().child(path);
    final uploadTask = ref.putData(Uint8List.fromList(afile));
    final snapshot = await uploadTask;
    final downloadUrl = await snapshot.ref.getDownloadURL();
    song_down_url = downloadUrl;
    return downloadUrl;
  }

  finalUpload(context) {
    var data = {
      'song': song_down_url.toString(),
      'song_name': _song.text,
      'image': image_down_url.toString(),
    };
    firestoreinstance
        .collection('Music')
        .doc(_song.text)
        .set(data)
        .whenComplete(() => showDialog(
              context: context,
              builder: (context) => _onTapButton(
                  context, "You have successfully uploaded the song :)"),
            ));
    ;
  }

  _onTapButton(BuildContext context, data) {
    return AlertDialog(
        title: const Text("Success"),
        content: Text(data),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const UploadSong()),
                  (route) => false);
            },
            child: const Text('OK'),
          ),
        ],
        icon: const CircleAvatar(
            backgroundColor: Color(0xffD2CEF6),
            child: Icon(
              Icons.check,
              color: Colors.green,
            )));
  }

  @override
  Widget build(BuildContext context) {
    _song.text = (Song != null ? basename(Song!.path) : 'No Song Selected');
    _image.text = (image != null ? basename(image!.path) : 'No Image Selected');
    return Scaffold(
      body: SafeArea(
        child: Builder(builder: (context) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: const Color(0xffD2CEF6),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new,
                              color: Colors.black),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Center(
                          child: Text('Upload Your Song',
                              style: GoogleFonts.lato(
                                //  color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              GestureDetector(
                onTap: () {
                  selectImage();
                },
                child: Center(
                  child: DottedBorder(
                    dashPattern: const [10, 5],
                    color: Colors.grey,
                    strokeWidth: 2,
                    radius: const Radius.circular(20),
                    borderType: BorderType.RRect,
                    child: SizedBox(
                      width: image != null ? 220.h : 220.h,
                      height: image != null ? 220.h : 80.h,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              image == null
                                  ? Icon(
                                      Icons.image_not_supported,
                                      size: 30,
                                      color: Colors.red,
                                    )
                                  : SizedBox(
                                      width: 0,
                                    ),
                              image == null
                                  ? SizedBox(width: 10.w)
                                  : SizedBox(width: 0.w),
                              Flexible(
                                child: image == null
                                    ? Text(
                                        'Select your image from here',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Image.file(
                                        image!,
                                        width: 200.h,
                                        height: 200.h,
                                      ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  songSelect();
                },
                child: Center(
                  child: DottedBorder(
                    dashPattern: const [10, 5],
                    color: Colors.grey,
                    strokeWidth: 2,
                    radius: const Radius.circular(20),
                    borderType: BorderType.RRect,
                    child: SizedBox(
                      width: 300,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Song != null
                                    ? Icons.music_note
                                    : Icons.audio_file_rounded,
                                size: 30,
                                color: Colors.red,
                              ),
                              SizedBox(width: 10.w),
                              Flexible(
                                child: Text(
                                  Song != null
                                      ? basename(Song!.path)
                                      : 'Select your song from here',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 50),
                child: TextField(
                  controller: _song,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    // prefix:
                    //     Icon(Icons.music_note, color: Colors.black, size: 30),
                    label: const Center(child: Text("Enter Song Name")),
                    errorText:
                        _songValidate ? 'Song Name Can\'t Be Empty' : null,
                    focusColor: Colors.black,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),

              const SizedBox(height: 30),
              // upload button
              Center(
                  child: SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _song.text.isEmpty
                          ? _songValidate = true
                          : _songValidate = false;

                      if (_songValidate == false) {
                        finalUpload(context);
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffD2CEF6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Upload',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
            ],
          );
        }),
      ),
    );
  }
}
