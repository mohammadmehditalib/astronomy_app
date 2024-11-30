import 'package:astronomy_app/features/Presentation%20layer/cubit/cubit/astronomy_cubit.dart';
import 'package:astronomy_app/features/Astronomy/data/datasources/ApiService.dart';
import 'package:astronomy_app/features/Astronomy/data/repositories/astronomy_repository_impl.dart';
import 'package:astronomy_app/features/Astronomy/domain/repository_interfaces/astronomy_repository.dart';
import 'package:astronomy_app/features/Astronomy/domain/usecases/get_astronomy_picture.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<ApiService>(() => ApiService(http.Client()));
  sl.registerLazySingleton<AstronomyRepository>(() => AstronomyRepositoryImpl(sl()));
  sl.registerLazySingleton<GetAstronomyPicture>(() => GetAstronomyPicture(sl()));
  sl.registerFactory<AstronomyCubit>(() => AstronomyCubit(sl()));
}
