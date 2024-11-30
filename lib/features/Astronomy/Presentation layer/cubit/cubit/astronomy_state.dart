import 'package:astronomy_app/features/Astronomy/data/Models/astronomy_picture_model.dart';

abstract class AstronomyState {}

class AstronomyInitial extends AstronomyState {}

class AstronomyLoading extends AstronomyState {}

class AstronomyLoaded extends AstronomyState {
  final AstronomyPicture picture;
  AstronomyLoaded(this.picture);
}

class AstronomyError extends AstronomyState {
  final String message;
  AstronomyError(this.message);
}
