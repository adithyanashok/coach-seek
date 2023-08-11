import 'dart:io';

import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/database/model/user/user.dart';

import 'package:coach_seek/services/firebase_sign_up_method.dart';
import 'package:coach_seek/view/core/colors.dart';
import 'package:coach_seek/view/core/snack_bar.dart';
import 'package:coach_seek/view/widgets/circle_loading_widget.dart';
import 'package:coach_seek/view/widgets/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/text_form_field.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdatingScreen extends StatefulWidget {
  const ProfileUpdatingScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  final dynamic data;

  @override
  State<ProfileUpdatingScreen> createState() => _ProfileUpdatingScreenState();
}

class _ProfileUpdatingScreenState extends State<ProfileUpdatingScreen> {
  File? imageFile;

  //<---------------------Image Picker Function------------------>
  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        setState(() {
          imageFile = File(pickedImage.path);
        });
      }
    } catch (e) {
      snackBar(context: context, msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the state from AuthBloc
    final state = context.read<AuthBloc>().state.user;

    //<--------------Passing initial values of logged-in user--------->//
    final userData = UserModel();
    userData.userId = state['userId'];
    userData.email = state['email'];
    userData.name = state['name'];
    userData.role = state['role'];
    userData.location = state['location'];
    userData.amount = state['amount'];
    userData.desc = state['desc'];
    userData.phone = state['phone'];
    userData.profileImg = state['profileImg'];

    // <------------------------Scaffold--------------->
    return Scaffold(
      //<--------------------------App Bar--------------->
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(title: "Edit profile"),
      ),
      //<-------------------------bloc builder---------------->
      body: BlocBuilder<AuthBloc, AuthState>(
        //builder
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //<---------------------Profile image(if not selected an image it takes the default avatar)---------->
                      Center(
                        child: profileImage(context),
                      ),
                      //<---------------Name Text field--------------->

                      buildTextFieldLabel(title: "Name"),
                      buildTextFormField(
                        func: (value) {
                          userData.name = value.isNotEmpty
                              ? value
                              : "${state.user['name']}";
                        },
                        hintText: "${state.user['name']}",
                        type: "text",
                        iconName: Icons.person,
                        value: "${state.user['name']}",
                      ),
                      //<---------------Role Text field--------------->

                      buildTextFieldLabel(title: "Role"),
                      buildTextFormField(
                        func: (value) {
                          userData.role = value.isNotEmpty
                              ? value
                              : "${state.user['role']}";
                        },
                        hintText: "${state.user['role']}",
                        type: "text",
                        iconName: Icons.person_pin,
                        value: state.user['role'],
                      ),
                      //<---------------Location Text field--------------->

                      buildTextFieldLabel(title: "Location"),
                      buildTextFormField(
                        func: (value) {
                          userData.location = value.isNotEmpty
                              ? value
                              : "${state.user['location']}";
                        },
                        hintText: "${state.user['location']}",
                        type: "text",
                        iconName: Icons.location_on_outlined,
                        value: state.user['location'],
                      ),
                      //<---------------Amount Text field--------------->

                      buildTextFieldLabel(title: "Amount"),
                      buildTextFormField(
                        func: (value) {
                          userData.amount = value.isNotEmpty
                              ? value
                              : "${state.user['amount']}";
                        },
                        hintText: "${state.user['amount']}",
                        type: "phone",
                        iconName: Icons.attach_money_outlined,
                        value: state.user['amount'],
                      ),
                      //<---------------Phone Text field--------------->

                      buildTextFieldLabel(title: "Phone"),
                      buildTextFormField(
                        func: (value) {
                          userData.phone = value.isNotEmpty
                              ? value
                              : "${state.user['phone']}";
                        },
                        hintText: "${state.user['phone']}",
                        type: "phone",
                        iconName: Icons.phone,
                        value: state.user['phone'],
                      ),
                      //<---------------About Text field--------------->

                      buildTextFieldLabel(title: "About"),
                      buildTextAreaFormField(
                        func: (value) {
                          userData.desc = value.isNotEmpty
                              ? value
                              : "${state.user['desc']}";
                        },
                        hintText: "${state.user['desc']}",
                        type: "type",
                        value: state.user['desc'],
                      ),
                      //<---------------Submit button Text field--------------->

                      buildSignupButton(
                        buttonName: "Edit",
                        buttonColor: "blue",
                        top: 20,
                        //On tap function
                        func: () async {
                          // Changing state to loading true
                          context
                              .read<AuthBloc>()
                              .add(const UpdateEvent(loading: true));

                          // Calling update function
                          await FirebaseSignUpMethod(context)
                              .uploadImageToFirebase(
                            userData: userData,
                            imageFile: imageFile,
                          );

                          // After updating profile, changing state to loading false
                          // ignore: use_build_context_synchronously
                          context
                              .read<AuthBloc>()
                              .add(const UpdateEvent(loading: false));

                          // Pop the screen
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),

                // Check loading: if loading => show loading
                if (state.loading) circleLoadingWidget(),
              ],
            ),
          );
        },
      ),
    );
  }

  //<---------------------------------Extracted Widgets---------------------------->

  //----------------------Profile image(shows selected image)------------->
  Widget profileImage(BuildContext context) {
    final state = context.read<AuthBloc>().state.user;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            // Show bottom sheet when clicking this widget

            // Extraced bottom sheet
            builBottomSheet(context);
          },
          // Circle avatar to display the image
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            // If image file is null, show the default avatar image; if it's not null, show the selected image
            child: imageFile == null
                ? ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(50),
                      child: Image.network(state['profileImg']),
                    ),
                  )
                //<------------------display selected image----------->
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
            // Show bottom sheet when clicking this widget

            // Extraced bottom sheet
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

  //<------------------------Bottom sheet----------------------->
  Future<dynamic> builBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        //<-----------------Sized box--------------------->
        return SizedBox(
          width: double.infinity,
          height: 200,
          //<----------------Row----------------------->
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //<-------------------Button for opening camera-------------->
              buildIconButton(
                const Icon(Icons.camera_alt),
                AppColors.lightbluecolor,
                () async {
                  // Call the function and pass the parameter (source: camera)
                  await _pickImage(ImageSource.camera);
                },
              ),
              buildIconButton(
                const Icon(Icons.photo),
                AppColors.lightbluecolor,
                () async {
                  // Call the function and pass the parameter (source: gallery)
                  await _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

// <---------------Icon button--------------->
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
