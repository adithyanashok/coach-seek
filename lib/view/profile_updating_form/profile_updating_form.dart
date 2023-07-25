import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/database/user/user.dart';
import 'package:coach_seek/services/firebase_auth.dart';
import 'package:coach_seek/view/widgets/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdatingScreen extends StatelessWidget {
  const ProfileUpdatingScreen({
    Key? key,
    required this.data,
  }) : super(key: key);
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    final state = context.read<AuthBloc>().state.user;
    // Passing initial values to userModel//
    final userData = UserModel();
    userData.userId = state['userId'];
    userData.email = state['email'];
    userData.name = state['name'];
    userData.role = state['role'];
    userData.location = state['location'];
    userData.amount = state['amount'];
    userData.desc = state['desc'];
    userData.phone = state['phone'];
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
            // check loading if loading => show loading if not loading show the form
            child: state.loading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          type: "text",
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
                          onBoardingbutton: "signin",
                          buttonType: "signup",
                          value: 130,
                          //On tap function
                          func: () async {
                            // changing state to loading true
                            context
                                .read<AuthBloc>()
                                .add(const UpdateEvent(loading: true));
                            await FireBaseAuthClass().updateTheData(
                              user: userData,
                            );

                            // after updating profile changing state to loading false
                            // ignore: use_build_context_synchronously
                            context
                                .read<AuthBloc>()
                                .add(const UpdateEvent(loading: false));

                            // pop the screen
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
