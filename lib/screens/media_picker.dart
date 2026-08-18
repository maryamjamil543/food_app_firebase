import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaPickerScreen extends StatefulWidget {
  const MediaPickerScreen({super.key});

  @override
  State<MediaPickerScreen> createState() => _MediaPickerScreenState();
}

class _MediaPickerScreenState extends State<MediaPickerScreen> {
  final ImagePicker picker = ImagePicker();

  XFile? selectedImage;
  XFile? selectedVideo;

  // Pick image from gallery
  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        selectedImage = image;
        selectedVideo = null;
      });
    }
  }

  // Take image from camera
  Future<void> takePhoto() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (image != null) {
      setState(() {
        selectedImage = image;
        selectedVideo = null;
      });
    }
  }

  // Pick video from gallery
  Future<void> pickVideo() async {
    final XFile? video = await picker.pickVideo(
      source: ImageSource.gallery,
    );

    if (video != null) {
      setState(() {
        selectedVideo = video;
        selectedImage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image & Video Picker"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // Image preview
            if (selectedImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  File(selectedImage!.path),
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )

            // Video preview
            else if (selectedVideo != null)
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Icon(
                    Icons.video_file,
                    size: 80,
                  ),
                ),
              )

            // Nothing selected
            else
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "No media selected",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

            const SizedBox(height: 30),

            // Gallery image
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: pickImage,
                icon: const Icon(Icons.photo),
                label: const Text("Pick Image"),
              ),
            ),

            const SizedBox(height: 10),

            // Camera
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: takePhoto,
                icon: const Icon(Icons.camera_alt),
                label: const Text("Take Photo"),
              ),
            ),

            const SizedBox(height: 10),

            // Video
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: pickVideo,
                icon: const Icon(Icons.video_library),
                label: const Text("Pick Video"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}