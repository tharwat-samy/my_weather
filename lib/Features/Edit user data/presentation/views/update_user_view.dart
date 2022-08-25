import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myweather/Features/Edit%20user%20data/presentation/manger/cubit/edit_data_cubit.dart';
import 'package:myweather/Features/home/presentation/manger/weather_cubit/weather_cubit.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/singleton/shared_prefrence_singleton.dart';
import 'package:myweather/core/widgets/custom_gradient_background.dart';
import 'package:myweather/core/widgets/custom_loading_indicator.dart';
import 'package:myweather/core/widgets/success_bar.dart';

import '../../../../core/widgets/error_bar.dart';
import '../widgets/update_user_view_body.dart';

class UpdateUserView extends StatelessWidget {
  const UpdateUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EditDataCubit, EditDataState>(
        listener: (context, state) {
          if (state is EditDataSuccess) {
            BlocProvider.of<WeatherCubit>(context).getWeather(
              cityName: Prefs.prefs.getString(kCityName),
            );

            sucessBar(context, message: 'تم تعديل البيانات بنجاح');
          }

          if (state is EditDataFailure) {
            errorBar(context, message: state.errMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            color: Colors.transparent,
            progressIndicator: CustomLoadingIndicator(),
            inAsyncCall: state is EditDataLoading ? true : false,
            child: CustomGradientBackGround(
              child: UpdateUserViewBody(),
            ),
          );
        },
      ),
    );
  }
}
