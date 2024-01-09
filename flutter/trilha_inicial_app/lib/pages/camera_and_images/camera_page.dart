import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

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
        appBar: const CustomAppBar(title: "Câmera"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: FilledButton(
                  onPressed: () async {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: const FaIcon(FontAwesomeIcons.camera),
                                title: const Text("Câmera"),
                                onTap: () async {
                                  final ImagePicker picker = ImagePicker();
                                  photo = await picker.pickImage(
                                      source: ImageSource.camera);
                                  if (photo != null) {
                                    String path = (await path_provider
                                            .getApplicationDocumentsDirectory())
                                        .path;
                                    String name = photo!.path.split("/").last;
                                    await photo!.saveTo("$path/$name");

                                    await ImageGallerySaver.saveFile(
                                        photo!.path);
                                    setState(() {});
                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }
                                  }
                                },
                              ),
                              ListTile(
                                leading: const FaIcon(FontAwesomeIcons.images),
                                title: const Text("Galeria"),
                                onTap: () async {
                                  final ImagePicker picker = ImagePicker();
                                  photo = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {});
                                  if (context.mounted) {
                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Text("Image Picker"),
                ),
              ),
              photo != null
                  ? Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Image.file(
                        File(photo!.path),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
