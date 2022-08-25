import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:myweather/core/singleton/shared_prefrence_singleton.dart';

import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/error_bar.dart';
import '../../manger/pick_location_cubit/pick_location_cubit.dart';
import 'custom_user_choices.dart';

class ChoicesBuilder extends StatelessWidget {
  const ChoicesBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PickLocationCubit, PickLocationState>(
      listener: (context, state) {
        if (state is PickLocationSuccess) {
              
            
          
        }
        if (state is PickLocationFailure) {
          errorBar(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is PickLocationLoading) {
          return Expanded(
            child: Column(
              children: const [
                Spacer(),
                CustomLoadingIndicator(),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          );
        } else {
          return const LocationChoices();
        }
      },
    );
  }
}
