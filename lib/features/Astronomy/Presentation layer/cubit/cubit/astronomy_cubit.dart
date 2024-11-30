import 'package:astronomy_app/features/Astronomy/Presentation%20layer/cubit/cubit/astronomy_state.dart';
import 'package:astronomy_app/features/Astronomy/domain/usecases/get_astronomy_picture.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
