import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'GifView.dart';

class GifMain extends StatelessWidget {
  const GifMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Trimmer"),
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text("LOAD VIDEO"),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.video,
                allowCompression: false,
              );
              if (result != null) {
                File file = File(result.files.single.path!);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return GifView(file: file.toString());
                  }),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
