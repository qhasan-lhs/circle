import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:circle/models/DataProvider.dart';

import 'package:circle/widgets/RoundedButton.dart';

class PostForm extends StatefulWidget {
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  String _username;
  String _posttext;
  File _userimage;
  File _postimage;

  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFileFromGallery =
        await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFileFromGallery != null) {
        _userimage = File(pickedFileFromGallery.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFileFromCamera =
        await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFileFromCamera != null) {
        _postimage = File(pickedFileFromCamera.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Create a New Post',
              style: TextStyle(fontSize: 20.0, color: Colors.purple[800]),
            ),
            SizedBox(height: 15.0),
            TextField(
              style: TextStyle(fontSize: 15.0),
              decoration: InputDecoration(
                hintText: 'User Name',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
              onChanged: (value) {
                _username = value;
              },
            ),
            SizedBox(height: 10.0),
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Center(
            //         child: _userimage == null
            //             ? Text('No image selected.')
            //             : Image.file(
            //                 _userimage,
            //                 scale: 5.0,
            //               ),
            //       ),
            //       IconButton(
            //         icon: Icon(
            //           Icons.drive_folder_upload,
            //           size: 40.0,
            //         ),
            //         onPressed: getImageFromGallery,
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 10.0),
            TextField(
              style: TextStyle(fontSize: 15.0),
              decoration: InputDecoration(
                hintText: 'Post Text',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _posttext = value;
              },
            ),
            SizedBox(height: 10.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: _postimage == null
                        ? Text('No image selected.')
                        : Image.file(
                            _postimage,
                            scale: 5.0,
                          ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.drive_folder_upload,
                      size: 40.0,
                    ),
                    onPressed: getImageFromCamera,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            RoundedButton(
              title: 'Post!',
              onPressed: () {
                Map json = {
                  'username': _username,
                  // 'userimage': _userimage.path,
                  'posttext': _posttext,
                  'postimage': _postimage.path,
                };
                print(json);
                Provider.of<DataProvider>(context, listen: false).addPost(json);
                // createPostWithImage(json);
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
