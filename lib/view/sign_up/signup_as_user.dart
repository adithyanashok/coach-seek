import 'dart:developer';
import 'dart:io';

import 'package:coach_seek/controller/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/controller/bloc/sign_up/sign_up_bloc.dart';
import 'package:coach_seek/services/firebase_auth/firebase_sign_up_method.dart';
import 'package:coach_seek/view/core/colors.dart';
import 'package:coach_seek/view/core/snack_bar.dart';
import 'package:coach_seek/view/widgets/circle_loading_widget.dart';
import 'package:coach_seek/view/widgets/sub_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/app_bar_widgets.dart';
import '../widgets/signin_image.dart';
import '../widgets/signup_button.dart';
import '../widgets/text_form_field.dart';

class UserSignupScreen extends StatefulWidget {
  const UserSignupScreen({Key? key}) : super(key: key);

  @override
  State<UserSignupScreen> createState() => _UserSignupScreenState();
}

class _UserSignupScreenState extends State<UserSignupScreen> {
  File? imageFile;

  // Function to pick an image from the camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        setState(() {
          imageFile = File(pickedImage.path);
        });
        log("Image File Error: $imageFile");
      } else {
        return snackBar(context: context, msg: "Please upload image");
      }
    } catch (e) {
      snackBar(context: context, msg: "Error at Signup $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // final user = ModalRoute.of(context)?.settings.arguments as String?;
    log("user");
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(title: "Sign up"),
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildLoginImage(imageName: "signup-image"),
                      buildSubHeadings(text: "Create an account to\ncontinue"),
                      profileImage(context),
                      Center(
                        child: imageFile == null
                            ? const Text('No image selected.')
                            : const Text(""),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextFieldLabel(title: "Name"),
                          buildTextFormField(
                            hintText: "Enter your name",
                            type: "name",
                            iconName: Icons.person_outlined,
                            func: (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(SignUpEvent.nameEvent(value));
                            },
                          ),
                          buildTextFieldLabel(title: "Email"),
                          buildTextFormField(
                            hintText: "Enter your email",
                            type: "email",
                            iconName: Icons.email_outlined,
                            func: (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(SignUpEvent.emailEvent(value));
                            },
                          ),
                          buildTextFieldLabel(title: "Password"),
                          buildTextFormField(
                            hintText: "Enter your password",
                            type: "password",
                            iconName: Icons.lock_outline,
                            func: (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(SignUpEvent.passwordEvent(value));
                            },
                          ),
                          buildTextFieldLabel(title: "Phone"),
                          buildTextFormField(
                            hintText: "Enter your phone number",
                            type: "phone",
                            iconName: Icons.phone,
                            func: (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(SignUpEvent.phoneEvent(value));
                            },
                          ),
                          buildTextFieldLabel(title: "Location"),
                          buildTextFormField(
                            hintText: "eg: Bangalore",
                            type: "text",
                            iconName: Icons.location_on_outlined,
                            func: (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(SignUpEvent.locationEvent(value));
                            },
                          ),
                          buildTextFieldLabel(title: "About"),
                          buildTextAreaFormField(
                            hintText: "Write something about you...",
                            type: "desc",
                            func: (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(SignUpEvent.descEvent(value));
                            },
                          ),
                          buildSignupButton(
                            buttonName: "Sign Up",
                            buttonColor: "blue",
                            top: 40,
                            func: () async {
                              // Show loading widget during image upload

                              BlocProvider.of<AuthBloc>(context)
                                  .add(const LoadingEvent(loading: true));

                              // Call the method to upload the image to Firebase Storage
                              await FirebaseSignUpMethod(context)
                                  .uploadImageToFirebase(imageFile: imageFile);

                              // Hide loading widget after image upload
                              BlocProvider.of<AuthBloc>(context)
                                  .add(const LoadingEvent(loading: false));
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
                // Show a circular loading widget if state.loading is true
                if (state.loading) circleLoadingWidget(),
              ],
            );
          },
        ),
      ),
    );
  }

  // Widget to display the profile image and handle image selection
  Widget profileImage(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            builBottomSheet(context);
          },
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: imageFile == null
                ? Image.asset(
                    'assets/images/profile-avatar.png',
                    fit: BoxFit.cover,
                    width: 250,
                    height: 250,
                  )
                : ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(50),
                      child: Image.file(imageFile!),
                    ),
                  ),
          ),
        ),
        IconButton(
          onPressed: () {
            builBottomSheet(context);
          },
          icon: Icon(
            Icons.add_a_photo_rounded,
            color: AppColors.lightbluecolor,
          ),
          padding: const EdgeInsets.only(left: 70, top: 60),
        )
      ],
    );
  }

  // Bottom sheet widget to choose between camera and gallery for image selection
  Future<dynamic> builBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildIconButton(
                const Icon(Icons.camera_alt),
                AppColors.lightbluecolor,
                () {
                  _pickImage(ImageSource.camera);
                },
              ),
              buildIconButton(
                const Icon(Icons.photo),
                AppColors.lightbluecolor,
                () {
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

// Common Icon button widget
Widget buildIconButton(Icon iconName, Color iconColor, Function? onClick) {
  return IconButton(
    onPressed: () {
      onClick!();
    },
    icon: iconName,
    iconSize: 60,
    color: iconColor,
  );
}
