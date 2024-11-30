import 'package:astronomy_app/features/Astronomy/Presentation%20layer/cubit/cubit/astronomy_cubit.dart';
import 'package:astronomy_app/features/Astronomy/Presentation%20layer/pages/imagefetcherfile.dart';
import 'package:flutter/material.dart';
import 'package:astronomy_app/features/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astronomy_app/features/injection_container.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => sl<AstronomyCubit>(),
        child: const ImageFetcherPage(),
      ),
    );
  }
}
