import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telegram_clone/core/widgets/bottomstyle/bottomstyle_widget.dart';
import 'package:telegram_clone/core/widgets/textfield/textfiled_model.dart';
import 'package:telegram_clone/core/widgets/textstyle/text_style.dart';
import 'package:telegram_clone/presentation/main/bloc/main_bloc.dart';
import 'package:telegram_clone/routes/routes_name.dart';

import '../../../../core/utils/app_colors.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({super.key});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  TextEditingController userName = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController phone = TextEditingController();

  final user = FirebaseAuth.instance.currentUser;

  var url;
  var url1;
  File? file;
  ImagePicker image = ImagePicker();
  DatabaseReference? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('contacts');
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.user == null) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 82,
            backgroundColor: AppColors.C_36B8B8,
            title: TextStyleModel.items(text: 'Settings', size: 18),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: media.size.height * 15 / 640,
                  ),
                  file == null
                      ? GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: Center(
                            child: CircleAvatar(
                              radius: 80,
                              child: Image.network(
                                user!.photoURL ?? 'M',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      : MaterialButton(
                          height: 100,
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              child: Image.file(
                                file!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                  SizedBox(
                    height: media.size.height * 23 / 640,
                  ),
                  TextField(
                    controller: userName,
                    decoration:
                        TextFormFiledModel.items(text: user!.displayName ?? ''),
                  ),
                  SizedBox(
                    height: media.size.height * 23 / 640,
                  ),
                  TextField(
                    controller: email,
                    decoration: TextFormFiledModel.items(text: user!.email!),
                  ),
                  SizedBox(
                    height: media.size.height * 23 / 640,
                  ),
                  TextField(
                    controller: phone,
                    decoration: TextFormFiledModel.items(
                        text: state.user?.phoneNumber ?? '+998'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: BottomStyleModel.item(),
                    onPressed: () {
                      if ((file != null) && (userName.text.isNotEmpty)) {
                        uploadFile();
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  uploadFile() async {
    try {
      var imageFile = FirebaseStorage.instance
          .ref()
          .child('person_photo')
          .child('/${userName.text}.jpg');
      UploadTask task = imageFile.putFile(file!);
      TaskSnapshot snapshot = await task;
      url = snapshot.ref.getDownloadURL();
      setState(() {
        url = url;
      });
      if (url != null) {
        Map<String, String> Contact = {
          'name': userName.text,
          'number': phone.text,
          'url': url,
        };
        dbRef!.push().set(Contact).whenComplete(
              () => Navigator.pushNamed(context, RoutesName.settingPage),
            );
      }
    } on Exception catch (e) {
      print(
        ('Error===>${e}'),
      );
    }
  }
}
