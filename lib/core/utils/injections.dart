// Injection file contain all injection methods feature, and it is called from the main.dart
// Using GetIt

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yemenshabab/features/auth/data/repositories/user_repository_impl.dart';
import 'package:yemenshabab/features/auth/data/services/firebase_service.dart';
import 'package:yemenshabab/features/auth/domian/repositories/user_repository.dart';
import 'package:yemenshabab/features/auth/domian/usecases/create_user.dart';
import 'package:yemenshabab/features/auth/domian/usecases/sign_in.dart';
import 'package:yemenshabab/features/auth/domian/usecases/sign_out.dart';
import 'package:yemenshabab/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:yemenshabab/features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:yemenshabab/features/favorite/data/repositories/favorite_repository_impl.dart';
import 'package:yemenshabab/features/favorite/data/service/favorite_service.dart';
import 'package:yemenshabab/features/favorite/domian/repositories/favorite_repository.dart';
import 'package:yemenshabab/features/favorite/domian/usecases/add_favorite.dart';
import 'package:yemenshabab/features/favorite/domian/usecases/get_favorites.dart';
import 'package:yemenshabab/features/favorite/domian/usecases/remove_favorite.dart';
import 'package:yemenshabab/features/favorite/presentation/bloc/favorite_bloc/favorite_bloc.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  sl.registerFactory(
      () => SignInBloc(signInUseCase: sl(), signOutUseCase: sl()));
  sl.registerFactory(() => SignUpBloc(createUserUseCase: sl()));
  sl.registerFactory(() => FavoriteBloc(
        removeUseCase: sl(),
        addUseCase: sl(),
        getUseCase: sl(),
      ));

  // UseCases
  sl.registerLazySingleton(() => SignInUseCase(userRepository: sl()));
  sl.registerLazySingleton(() => SignOutUseCase(userRepository: sl()));
  sl.registerLazySingleton(() => CreateUserUseCase(userRepository: sl()));
  sl.registerLazySingleton(() => AddFavoriteUseCase(favoriteRepository: sl()));
  sl.registerLazySingleton(() => RemoveFavoriteUseCase(favoriteRepository: sl()));
  sl.registerLazySingleton(() => GetFavoritesUseCase(favoriteRepository: sl()));

  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(firebaseService: sl()));

  sl.registerLazySingleton<FavoriteRepository>(
      () => FavoriteRepositoryImpl(favoriteService: sl()));

  sl.registerLazySingleton<FirebaseService>(() => FirebaseServiceImpl(
        auth: sl(),
        fireStore: sl(),
      ));

  sl.registerLazySingleton<FavoriteService>(() => FavoriteServiceImpl(
        fireStore: sl(),
      ));

  // External

  final sharedPreferences = await SharedPreferences.getInstance();

  final Dio dio = Dio(BaseOptions(
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
  ));

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}
