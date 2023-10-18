import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? photo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Wrap(
                        children: [
                          ListTile(
                            title: const Text("Camera"),
                            onTap: () async {
                              final ImagePicker _picker = ImagePicker();
                              photo = await _picker.pickImage(
                                  source: ImageSource.camera);
                              if (photo != null) {
                                String path = (await path_provider
                                        .getApplicationDocumentsDirectory())
                                    .path;
                                String name = basename(photo!.path);
                                await photo!.saveTo("$path/$name");
                                await GallerySaver.saveImage(photo!.path);
                                Navigator.pop(context);
                              }
                            },
                          ),
                          ListTile(
                              title: const Text("Galeria"),
                              onTap: () async {
                                final ImagePicker _picker = ImagePicker();
                                photo = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                Navigator.pop(context);
                              })
                        ],
                      );
                    });
              },
              child: const Text("Camera")),
          photo != null
              ? Container(
                  child: Image.file(File(photo!.path)),
                )
              : Container()
        ],
      ),
      appBar: AppBar(
        title: const Text("Camera"),
      ),
    ));
  }
}