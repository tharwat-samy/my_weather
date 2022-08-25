import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/widgets/custom_general_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class UpdateUserViewBody extends StatelessWidget {
  const UpdateUserViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 24),
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
          CustomTextFormField(
            title: 'User name',
          ),
          const SpaceBox(
            height: 2,
          ),
          CustomTextFormField(
            title: 'Email',
          ),
          const SpaceBox(
            height: 2,
          ),
          CustomTextFormField(
            title: 'Password',
          ),
          const SpaceBox(
            height: 2,
          ),
          CustomTextFormField(
            title: 'Location',
          ),
          const SpaceBox(
            height: 1,
          ),
          Spacer(),
          CustomButton(
            text: 'Regster',
            backGroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
