import 'package:flutter/material.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future cropImage({
  required XFile? pickedFile,
}) async {
  CroppedFile? croppedFileSeleted;
  if (pickedFile != null) {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 90,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            activeControlsWidgetColor: primaryColor,
            toolbarColor: primary3Color,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            hideBottomControls: true,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      croppedFileSeleted = croppedFile;
      return croppedFileSeleted.path.toString();
    } else {
      return pickedFile.path.toString();
    }
  }
  return pickedFile!.path.toString();
}

Future userImage({
  required XFile? pickedFile,
}) async {
  CroppedFile? croppedFileSeleted;
  if (pickedFile != null) {
    final croppedFile = await ImageCropper().cropImage(
      aspectRatioPresets: [CropAspectRatioPreset.original],
      cropStyle: CropStyle.circle,
      sourcePath: pickedFile.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 90,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            activeControlsWidgetColor: primaryColor,
            toolbarColor: primary3Color,
            toolbarWidgetColor: Colors.white,
            hideBottomControls: true,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      croppedFileSeleted = croppedFile;
      return croppedFileSeleted.path.toString();
    } else {
      return pickedFile.path.toString();
    }
  }
  return pickedFile!.path.toString();
}
