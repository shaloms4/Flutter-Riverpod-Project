import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mobileriverpod/infrastructure/auth/repository/login_repository.dart';
import 'package:mobileriverpod/infrastructure/auth/data_provider/login_data_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobileriverpod/domain/auth/model/login_model.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([AuthDataProvider, SharedPreferences, Dio])
import 'login_test.mocks.dart';

void main() {
  late MockAuthDataProvider mockAuthDataProvider;
  late MockSharedPreferences mockSharedPreferences;
  late AuthRepository authRepository;
  late MockDio mockDio;
  late AuthDataProvider authDataProvider;

  setUp(() {
    mockAuthDataProvider = MockAuthDataProvider();
    mockSharedPreferences = MockSharedPreferences();
    mockDio = MockDio();
    authDataProvider = AuthDataProvider(mockDio);
    authRepository =
        AuthRepository(mockAuthDataProvider, mockSharedPreferences);
  });

  group('AuthRepository', () {
    test('login returns true and saves token and userId when successful',
        () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password';
      final role = Role.USER;
      final loginResponse = {
        'token': 'mockToken',
        'userId': 1,
      };

      when(mockAuthDataProvider.login(email, password, role))
          .thenAnswer((_) async => loginResponse);

      when(mockSharedPreferences.setString('token', 'mockToken'))
          .thenAnswer((_) async => true);
      when(mockSharedPreferences.setInt('userId', 1))
          .thenAnswer((_) async => true);

      // Act
      final result = await authRepository.login(email, password, role);

      // Assert
      expect(result, true);
      verify(mockSharedPreferences.setString('token', 'mockToken')).called(1);
      verify(mockSharedPreferences.setInt('userId', 1)).called(1);
    });

    test('login returns false when AuthDataProvider.login throws an error',
        () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password';
      final role = Role.USER;

      when(mockAuthDataProvider.login(email, password, role))
          .thenThrow(Exception('Login failed'));

      // Act
      final result = await authRepository.login(email, password, role);

      // Assert
      expect(result, false);
      verifyNever(mockSharedPreferences.setString(any, any));
      verifyNever(mockSharedPreferences.setInt(any, any));
    });
  });

  group('AuthDataProvider', () {
    test('login returns token and userId on success', () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password';
      final role = Role.USER;
      final responsePayload = {
        'access_token': 'mockToken',
        'userId': 1,
      };

      when(mockDio.post(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
            data: responsePayload,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      // Act
      final result = await authDataProvider.login(email, password, role);

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['token'], 'mockToken');
      expect(result['userId'], 1);
    });

    test('login throws an exception on failure', () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password';
      final role = Role.USER;

      when(mockDio.post(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
            data: {'message': 'Invalid credentials'},
            statusCode: 401,
            requestOptions: RequestOptions(path: ''),
          ));

      // Act & Assert
      expect(
        () async => await authDataProvider.login(email, password, role),
        throwsA(isA<Exception>()),
      );
    });
  });
}
