
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class GifPreviw extends StatefulWidget {
  final String outputVideoPath;
  const GifPreviw({Key? key, required this.outputVideoPath}) : super(key: key);

  @override
  State<GifPreviw> createState() => _GifPreviwState();
}

class _GifPreviwState extends State<GifPreviw> {
  late VideoPlayerController _controller;


  @override
  // void initState() {
  //   super.initState();
  //
  //   _controller = VideoPlayerController.file(File(widget.outputVideoPath.toString()))
  //     ..initialize().then((_) {
  //       setState(() {});
  //       _controller.play();
  //     });
  // }

  @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Gif Preview"),
      ),
      body: Column(
        children: [
          Center(
            child:
            CachedNetworkImage(
              imageUrl:widget.outputVideoPath.toString() ,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fadeInDuration: Duration(milliseconds: 500),
              fit: BoxFit.cover,
              memCacheWidth: 600,
              memCacheHeight: 600,
            ),
          ),






        ],
      ),
    );
  }
}
