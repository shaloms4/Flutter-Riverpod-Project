import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mobileriverpod/application/auth/provider/registration_riverpod_provider.dart';
import 'package:mobileriverpod/domain/auth/model/registration_model.dart';
import 'package:mobileriverpod/infrastructure/auth/repository/registration_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('Registration Page Unit Tests', () {
    late AuthRepository authRepository;
    late RegistrationDataNotifier registrationDataNotifier;

    setUp(() {
      authRepository = MockAuthRepository();
      registrationDataNotifier = RegistrationDataNotifier();
    });

    test('Registration Success', () async {
      final registrationData = RegistrationData(
        email: 'test@example.com',
        password: 'password',
        username: 'testuser',
        firstName: 'Test',
        lastName: 'User',
        role: Role.USER,
      );

      // Set up the mock response to return registrationData
      when(authRepository.register(any))
          .thenAnswer((_) async => registrationData);

      // Trigger the registration
      registrationDataNotifier.updateData(registrationData);

      // Verify that the registration was successful
      expect(registrationDataNotifier.state, registrationData);
    });

    test('Registration Failure', () async {
      final registrationData = RegistrationData(
        email: 'test@example.com',
        password: 'password',
        username: 'testuser',
        firstName: 'Test',
        lastName: 'User',
        role: Role.USER,
      );

      // Set up the mock response to throw an error
      when(authRepository.register(any))
          .thenThrow(Exception('Registration failed'));

      // Trigger the registration
      expect(
        () async => await authRepository.register(registrationData),
        throwsException,
      );
    });
  });
}
