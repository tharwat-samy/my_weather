import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:myweather/Features/auth/data/repositries/auth_repo_impl.dart';
import 'package:myweather/Features/auth/presentaion/manger/login%20cubit/login_cubit.dart';
import 'package:myweather/Features/pick%20location/data/pick_location_repo_impl.dart';
import 'package:myweather/Features/pick%20location/presentaion/manger/pick_location_cubit/pick_location_cubit.dart';
import 'package:myweather/Features/splash/presentaion/views/splash_view.dart';
import 'package:myweather/core/utils/firebase_service.dart';
import 'package:myweather/core/utils/simple_bloc_observer.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyWeather());
}

class MyWeather extends StatelessWidget {
  const MyWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            AuthRepoImpl(
              FirebaseService(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => PickLocationCubit(
            PickLocationRepoImpl(),
          ),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SplashView(),
        ),
      ),
    );
  }
}
