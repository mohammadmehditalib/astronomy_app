import 'package:flutter/material.dart';
import 'package:astronomy_app/features/Presentation%20layer/cubit/cubit/astronomy_cubit.dart';
import 'package:astronomy_app/features/Presentation%20layer/cubit/cubit/astronomy_state.dart';
import 'package:astronomy_app/features/Presentation%20layer/widgets/imagewidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImageFetcherPage extends StatelessWidget {
  const ImageFetcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronomy Picture of the Day'),
      ),
      body: BlocBuilder<AstronomyCubit, AstronomyState>(
        builder: (context, state) {
          if (state is AstronomyLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Fetching latest pic of the day...'),
                ],
              ),
            );
          } else if (state is AstronomyLoaded) {
            Fluttertoast.showToast(
              msg: "Image fetched successfully!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display Image with loading indicator
                  SizedBox(
                      width: double.infinity,
                      child: Imagewidget(url: state.picture.url)),
                  const SizedBox(height: 20),
                  // Explanation Text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.picture.explanation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is AstronomyError) {
            Future.delayed(Duration.zero, () {
              showDialog(
                // ignore: use_build_context_synchronously
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: Text(state.message),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            });
            return const Center(child: Text('Error fetching image'));
          } else {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AstronomyCubit>(context).fetchAstronomyPicture();
                },
                child: const Text('Fetch Astronomy Picture of the Day'),
              ),
            );
          }
        },
      ),
    );
  }
}
