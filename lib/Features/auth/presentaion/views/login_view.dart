import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myweather/Features/auth/presentaion/widgets/login_view_body.dart';
import 'package:myweather/Features/home/presentation/views/home_view.dart';
import 'package:myweather/Features/pick%20location/presentaion/views/pick_location_view.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/widgets/custom_gradient_background.dart';
import 'package:myweather/core/widgets/custom_loading_indicator.dart';
import 'package:myweather/core/widgets/error_bar.dart';

import '../manger/auth_cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomGradientBackGround(
          child: bloc.BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Get.to(
                  () => PickLocationView(),
                  transition: Transition.fade,
                  duration: kTransionDuration,
                );
              }

              if (state is LoginFailure) {
                errorBar(context, message: state.errMesasge);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                  inAsyncCall: state is LoginLoading ? true : false,
                  progressIndicator: const CustomLoadingIndicator(),
                  child: LoginViewBody());
            },
          ),
        ));
  }
}
