import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileriverpod/infrastructure/auth/repository/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobileriverpod/infrastructure/auth/data_provider/login_data_provider.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) {
  return SharedPreferences.getInstance();
});

final authDataProviderProvider = Provider<AuthDataProvider>((ref) {
  final dio = Dio();
  return AuthDataProvider(dio);
});

final authRepositoryProvider = FutureProvider<AuthRepository>((ref) async {
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
  final authDataProvider = ref.read(authDataProviderProvider);
  return AuthRepository(authDataProvider, sharedPreferences);
});
