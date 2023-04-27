import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:nirvana/src/res/assetsImages.dart';
import 'package:nirvana/src/res/colors.dart';
import 'package:nirvana/src/views/congratulationScreen.dart';
import 'package:nirvana/src/views/googleLogin.dart';
import 'package:nirvana/src/views/songListScreen.dart';

import 'package:video_player/video_player.dart';

import '../components/videoPlayer.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen(this.songName, this.songUrl, {super.key});
  final String songName;
  final String songUrl;
  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });
    audioPlayer.onPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset(
      video,
    );
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

//Duration to time convert function
  String timeConvert(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  List<bool> selected = <bool>[];
  @override
  void dispose() {
    audioPlayer.dispose();
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    @override
    String url = widget.songUrl;

    selected.add(false);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffD2CEF6), Color(0xffD9D9D9)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: Stack(children: [
            Positioned(
              top: 4.h,
              right: 10.w,
              child: SizedBox(
                height: 40.h,
                width: 100.w,
                child: TextButton(
                  onPressed: () async {
                    // await audioPlayer.pause();
                    // await audioPlayer.dispose();
                    // await _controller.pause();
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CongratulationScreen(
                              title: timeConvert(position))),
                    );
                  },
                  child: Center(
                    child: Text(
                      'Done',
                      style: GoogleFonts.lato(
                        color: buttonColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                onPressed: () => {
                  audioPlayer.dispose(),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SongListScreen()),
                  )
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: 200.h,
              left: 0,
              right: 0,
              child: Container(
                height: 240.h,
                width: 240.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 56.w, right: 56.w),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 35.h, bottom: 35.h, left: 50.w, right: 50.w),
                    child: VideoPlayerScreen(
                        initializeVideoPlayerFuture:
                            _initializeVideoPlayerFuture,
                        controller: _controller),
                  ),
                ),
              ),
            ),
            //music slider
            Positioned(
              bottom: 260.h,
              left: 0,
              right: 0,
              child: Center(
                child: Text(widget.songName,
                    style: GoogleFonts.lato(
                      //color: Colors.black,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),
            Positioned(
              bottom: 200.h,
              child: Builder(builder: (context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 20.h,
                  child: Slider(
                    value: position.inSeconds.toDouble(),
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    activeColor: Color(0xffBB86FC),
                    inactiveColor: Colors.white,
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await audioPlayer.seek(position);
                      await audioPlayer.resume();
                      // setState(() {
                      //   audioPlayer.seek(Duration(seconds: value.toInt()));
                      // });
                    },
                  ),
                );
              }),
            ),
            Positioned(
              bottom: 180.h,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      formatTime(position),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      formatTime(duration),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 100.h,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () async {
                        const position = Duration(seconds: 0);
                        await audioPlayer.seek(position);
                        _controller.value.isPlaying
                            ? await audioPlayer.resume()
                            : await audioPlayer.pause();
                      },
                      icon: Icon(
                        Icons.replay,
                        size: 35.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: null,
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.fast_rewind,
                      size: 40.sp,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: IconButton(
                        splashColor: const Color(0xffBB86FC),
                        splashRadius: 30.r,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(0),
                        onPressed: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                          } else {
                            await audioPlayer.resume();
                          }
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                        icon: _controller.value.isPlaying
                            ? Icon(
                                Icons.pause,
                                size: 40.sp,
                                color: Color(0xffBB86FC),
                              )
                            : Icon(
                                Icons.play_arrow,
                                size: 40.sp,
                                color: Color(0xffBB86FC),
                              ),
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: null,
                    icon: Icon(
                      Icons.fast_forward,
                      size: 40.sp,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () async {
                        setState(() {
                          selected[0] = !selected[0];
                          selected[0]
                              ? audioPlayer.setReleaseMode(ReleaseMode.loop)
                              : audioPlayer.setReleaseMode(ReleaseMode.release);
                        });
                      },
                      icon: Icon(
                        selected[0]
                            ? Icons.repeat_one_on_rounded
                            : Icons.repeat_rounded,
                        size: 35.sp,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  Future setAudio() async {
    String url = widget.songUrl;
    await audioPlayer.setSourceUrl(url);
  }
}
