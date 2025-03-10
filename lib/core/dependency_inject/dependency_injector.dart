import 'package:get_it/get_it.dart';
import 'package:hospital/features/home/data/data_source/home_data_source.dart';
import 'package:hospital/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:hospital/features/home/domain/repository/home_repository.dart';
import 'package:hospital/features/home/domain/usecase/home_usecase.dart';
import 'package:hospital/features/home/presentation/cubit/home_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  await home();
}

Future<void> home() async {
  sl.registerLazySingleton(() => HomeUseCase(repository: sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(service: sl()));
  sl.registerLazySingleton(() => HomeDataSource());
  sl.registerFactory(() => HomeCubit(useCase: sl()));
}
