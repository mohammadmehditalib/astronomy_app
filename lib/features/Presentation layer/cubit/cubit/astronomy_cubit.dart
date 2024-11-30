import 'package:astronomy_app/features/Presentation%20layer/cubit/cubit/astronomy_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Astronomy/domain/usecases/get_astronomy_picture.dart';

class AstronomyCubit extends Cubit<AstronomyState> {
  final GetAstronomyPicture getAstronomyPicture;

  AstronomyCubit(this.getAstronomyPicture) : super(AstronomyInitial());

  void fetchAstronomyPicture() async {
    emit(AstronomyLoading());
    final result = await getAstronomyPicture();
    result.fold(
      (failure) => emit(AstronomyError(failure.message)),
      (picture) => emit(AstronomyLoaded(picture)),
    );
  }
}
