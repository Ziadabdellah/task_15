import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_15/core/functions/functions.dart';
import 'package:task_15/core/storage/local_storage.dart';
import 'package:task_15/core/utils/app_colors.dart';
import 'package:task_15/core/utils/styles.dart';
import 'package:task_15/core/widgets/custom_button.dart';
import 'package:task_15/features/home/Nav_bar.dart';

String? imagePath;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        actions: [
          TextButton(
              onPressed: () {
                if (imagePath != null && name.isNotEmpty) {
                  AppLocalStorage.cacheData(AppLocalStorage.IS_UPLOAD, true);
                  AppLocalStorage.cacheData(
                      AppLocalStorage.Image_Key, imagePath!);
                  AppLocalStorage.cacheData(AppLocalStorage.Name_Key, name);
                  pushWithReplacment(context, Nav_Bar());
                } else if (imagePath != null && name.isEmpty) {
                  showErrorWidget(
                    context,
                    'Please Enter Your Name',
                  );
                } else if (imagePath == null && name.isNotEmpty) {
                  showErrorWidget(context, 'Please Enter Your Image');
                } else {
                  showErrorWidget(
                      context, 'Please Enter Your Name and Your Image');
                }
              },
              child: Text('Done', style: getBodyStyle()))
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.appbarColor,
              backgroundImage: (imagePath != null)
                  ? FileImage(File(imagePath!)) as ImageProvider
                  : const AssetImage('assets/asd.jpg'),
            ),
            Gap(20),
            CustomButton(
              text: 'Upload from Camera',
              width: 260,
              onTap: () {
                _uploadFromCamera();
              },
            ),
            Gap(10),
            CustomButton(
              text: 'Upload from Gallery',
              width: 260,
              onTap: () {
                _uploadFromGallery();
              },
            ),
            Gap(10),
            Divider(),
            Gap(10),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
                print(name);
              },
              decoration: InputDecoration(
                hintText: 'Enter Your Name',
                helperStyle: TextStyle(color: AppColors.whiteColor),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.whiteColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.whiteColor)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.redColor)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.redColor)),
              ),
            ),
          ],
        ),
      )),
    );
  }

  //A>B>C
  //

  _uploadFromCamera() async {
    // open camera and picked image or not
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }

  _uploadFromGallery() async {
    // open camera and picked image or not
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }
}
