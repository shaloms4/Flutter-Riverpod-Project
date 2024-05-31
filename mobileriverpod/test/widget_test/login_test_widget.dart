import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mobileriverpod/application/auth/provider/login_riverpod_provider.dart';
import 'package:mobileriverpod/infrastructure/auth/repository/login_repository.dart';
import 'package:mobileriverpod/presentation/view/auth/login_page.dart';

// Import the generated mocks file
import 'login_test_widget.mocks.dart';

// Annotate with @GenerateMocks
@GenerateMocks([AuthRepository])
void main() {
  final mockAuthRepository = MockAuthRepository();

  setUp(() {
    // Reset the mock before each test
    reset(mockAuthRepository);
  });

  group('LoginPage Widget Tests', () {
    testWidgets('displays email and password fields',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authRepositoryProvider.overrideWithValue(mockAuthRepository),
          ],
          child: MaterialApp(
            home: LoginPage(),
          ),
        ),
      );

      expect(find.byKey(Key('emailField')), findsOneWidget);
      expect(find.byKey(Key('passwordField')), findsOneWidget);
    });

    testWidgets('displays login button', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authRepositoryProvider.overrideWithValue(mockAuthRepository),
          ],
          child: MaterialApp(
            home: LoginPage(),
          ),
        ),
      );

      expect(find.byKey(Key('loginButton')), findsOneWidget);
    });

    testWidgets('shows error message on login failure',
        (WidgetTester tester) async {
      when(mockAuthRepository.login(any, any, any))
          .thenAnswer((_) async => false);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authRepositoryProvider.overrideWithValue(mockAuthRepository),
          ],
          child: MaterialApp(
            home: LoginPage(),
          ),
        ),
      );

      // Enter email and password
      await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
      await tester.enterText(find.byKey(Key('passwordField')), 'password');

      // Tap login button
      await tester.tap(find.byKey(Key('loginButton')));
      await tester.pump(); // Wait for the button tap to register

      // Verify error message is shown
      expect(find.text('Login failed'), findsOneWidget);
    });
  });
}
