import 'package:alo_movies/layout/cubit/home_cubit.dart';
import 'package:alo_movies/layout/home_screen.dart';
import 'package:alo_movies/layout/tabs/classes_tab/cubit/classes_cubit.dart';
import 'package:alo_movies/layout/tabs/community_tab/cubit/community_cubit.dart';
import 'package:alo_movies/layout/tabs/over_view_tab/cubit/over_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helpers/bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
        () {
          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit(),),
        BlocProvider(create: (context) => OverViewCubit(),),
        BlocProvider(create: (context) => ClassesCubit(),),
        BlocProvider(create: (context) => CommunityCubit(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}