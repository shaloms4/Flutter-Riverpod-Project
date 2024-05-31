import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:mobileriverpod/infrastructure/auth/repository/login_repository.dart';
import 'package:mobileriverpod/infrastructure/auth/data_provider/login_data_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_riverpod_provider.mocks.dart';

// Assuming Role is defined somewhere in your project, import it
import 'package:mobileriverpod/domain/auth/model/login_model.dart';

@GenerateMocks([AuthDataProvider, SharedPreferences])
void main() {
  group('AuthRepository', () {
    final authDataProvider = MockAuthDataProvider();
    final sharedPreferences = MockSharedPreferences();
    final repository = AuthRepository(authDataProvider, sharedPreferences);

    test('login success', () async {
      when(authDataProvider.login(any, any, any)).thenAnswer((_) async => {
            'token': 'mock_token',
            'userId': 1,
          });
      when(sharedPreferences.setString('token', any))
          .thenAnswer((_) async => true);
      when(sharedPreferences.setInt('userId', any))
          .thenAnswer((_) async => true);

      final result =
          await repository.login('email@example.com', 'password', Role.USER);

      expect(result, isTrue);
      verify(authDataProvider.login('email@example.com', 'password', Role.USER))
          .called(1);
      verify(sharedPreferences.setString('token', 'mock_token')).called(1);
      verify(sharedPreferences.setInt('userId', 1)).called(1);
    });

    test('login failure', () async {
      when(authDataProvider.login(any, any, any))
          .thenThrow(Exception('Login failed'));

      final result =
          await repository.login('email@example.com', 'password', Role.USER);

      expect(result, isFalse);
      verify(authDataProvider.login('email@example.com', 'password', Role.USER))
          .called(1);
      verifyNever(sharedPreferences.setString('token', any));
      verifyNever(sharedPreferences.setInt('userId', any));
    });
  });
}
