import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/core/dependency_inject/dependency_injector.dart';
import 'package:hospital/features/home/presentation/cubit/home_cubit.dart';
import 'package:nested/nested.dart';

class StateManagementProviders {
  static List<SingleChildWidget> providers = [
    ///All Cubits are initialize here
    // BlocProvider(create: (_) => sl<SplashCubit>()),
    // BlocProvider(create: (_) => sl<ProfileCubit>()),
    // BlocProvider(create: (_) => sl<LoginCubit>()),
    BlocProvider(create: (_) => sl<HomeCubit>()),
    // BlocProvider(create: (_) => sl<ReportCubit>()),
  ];
}
