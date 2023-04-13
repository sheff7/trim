import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'GifView.dart';

class Preview extends StatefulWidget {
  final String outputVideoPath;

  const Preview({Key? key, required this.outputVideoPath}) : super(key: key);

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  late VideoPlayerController _controller;


  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(File(widget.outputVideoPath.toString()))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Preview"),
      ),
      body: Column(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: _controller.value.isInitialized
                  ? VideoPlayer(_controller)
                  : const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    ),
            ),
          ),






          Container(
            child: ElevatedButton(
              child: Text("LOAD VIDEO"),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => GifView(file:widget.outputVideoPath,),
                  ),
                );

              },
            ),
          )
        ],
      ),
    );
  }
}
