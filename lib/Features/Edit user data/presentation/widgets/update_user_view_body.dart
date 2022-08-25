import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myweather/Features/Edit%20user%20data/presentation/manger/cubit/edit_data_cubit.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/singleton/shared_prefrence_singleton.dart';

import '../../../../core/widgets/custom_general_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class UpdateUserViewBody extends StatelessWidget {
  UpdateUserViewBody({Key? key}) : super(key: key);

  String? userName, email, password, cityName;
  @override
  Widget build(BuildContext context) {
    User user = BlocProvider.of<EditDataCubit>(context).User;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SpaceBox(
              height: 7,
            ),
            Text(
              'Update Info',
              style: Styles.bodyText6,
            ),
            const SpaceBox(
              height: .5,
            ),
            const SpaceBox(
              height: 7,
            ),
            CustomTextField(
              onChanged: (value) {
                userName = value;
              },
              title: user.displayName,
            ),
            const SpaceBox(
              height: 2,
            ),
            CustomTextFormField(
              onChanged: (value) {
                email = value;
              },
              title: user.email,
            ),
            const SpaceBox(
              height: 2,
            ),
            CustomTextFormField(
              onChanged: (value) {
                password = value;
              },
              title: 'Password',
            ),
            const SpaceBox(
              height: 2,
            ),
            CustomTextFormField(
              onChanged: (value) {
                cityName = value;
              },
              title: Prefs.prefs.getString(kCityName),
            ),
            const SpaceBox(
              height: 7,
            ),
            CustomButton(
              onTap: () {
                BlocProvider.of<EditDataCubit>(context).UpdateData(
                  email: email,
                  location: cityName,
                  password: password,
                  userName: userName,
                );
              },
              text: 'Update',
              backGroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
