import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_general_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';
import '../manger/auth_cubit/login_cubit.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  String? userName, password, email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 24),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceBox(
              height: 7,
            ),
            Text(
              'Wanna be a Member !',
              style: Styles.bodyText6,
            ),
            const SpaceBox(
              height: .5,
            ),
            Text(
              'Create an Account',
              style: Styles.bodyText4.copyWith(
                color: Colors.grey.withOpacity(.7),
              ),
            ),
            const SpaceBox(
              height: 7,
            ),
            CustomTextFormField(
              onSaved: (value) {
                userName = value;
              },
              title: 'User name',
            ),
            const SpaceBox(
              height: 2,
            ),
            CustomTextFormField(
              onSaved: (value) {
                email = value;
              },
              title: 'Email',
            ),
            const SpaceBox(
              height: 2,
            ),
            CustomTextFormField(
              obsecureText: true,
              onSaved: (value) {
                password = value;
              },
              title: 'Password',
            ),
            const SpaceBox(
              height: 1,
            ),
            Spacer(),
            CustomButton(
              onTap: () {
                registerUser(context);
              },
              text: 'Regster',
              backGroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void registerUser(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      BlocProvider.of<AuthCubit>(context)
          .register(email: email!, password: password!, userName: userName!);
    }
  }
}
