import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mobileriverpod/domain/user/model/user_model.dart';
import 'package:mobileriverpod/domain/user/model/update_user_model.dart';
import 'package:mobileriverpod/infrastructure/user/data_provider/user_data_provider.dart';
import 'package:mobileriverpod/application/user/provider/user_riverpod_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_notifier_test.mocks.dart';

@GenerateMocks([UserDataProvider, SharedPreferences])
void main() {
  group('UserNotifier', () {
    late MockUserDataProvider mockUserDataProvider;
    late MockSharedPreferences mockSharedPreferences;
    late UserNotifier userNotifier;
    late int userId;

    setUp(() {
      mockUserDataProvider = MockUserDataProvider();
      mockSharedPreferences = MockSharedPreferences();
      userId = 1; // Example userId
      when(mockSharedPreferences.getInt('userId')).thenReturn(userId);
      when(mockSharedPreferences.getString('token')).thenReturn('test_token');

      userNotifier = UserNotifier(mockUserDataProvider, userId);
    });

    test('fetchUserProfile successfully fetches user profile', () async {
      final userProfile = UserProfile(
        userId: 1,
        username: 'testuser',
        email: 'test@example.com',
        firstname: 'Test',
        lastname: 'User',
      );

      when(mockUserDataProvider.getProfile())
          .thenAnswer((_) async => userProfile);

      await userNotifier.fetchUserProfile();

      expect(userNotifier.state, equals(userProfile));
    });

    test('fetchUserProfile handles error', () async {
      when(mockUserDataProvider.getProfile())
          .thenThrow(Exception('Failed to fetch user profile'));

      await userNotifier.fetchUserProfile();

      expect(userNotifier.state, isNotNull);
      expect(userNotifier.state!.userId, equals(0));
      expect(userNotifier.state!.username, isEmpty);
      expect(userNotifier.state!.email, isEmpty);
    });

    test('updateUserProfile updates user profile', () async {
      final updateDto = UpdateUserDto(
        userId: 1,
        username: 'updateduser',
        email: 'updated@example.com',
        firstname: 'Updated',
        lastname: 'User',
      );

      when(mockUserDataProvider.updateProfile(updateDto))
          .thenAnswer((_) async {});

      await userNotifier.updateUserProfile(updateDto);

      verify(mockUserDataProvider.updateProfile(updateDto)).called(1);
      verify(mockUserDataProvider.getProfile()).called(1);
    });

    test('deleteUserProfile deletes user profile', () async {
      when(mockUserDataProvider.deleteProfile()).thenAnswer((_) async {});

      await userNotifier.deleteUserProfile();

      expect(userNotifier.state, isNull);
      verify(mockUserDataProvider.deleteProfile()).called(1);
    });

    test('getAllUsers fetches all users', () async {
      final users = [
        UserProfile(
          userId: 1,
          username: 'user1',
          email: 'user1@example.com',
          firstname: 'User1',
          lastname: 'One',
        ),
        UserProfile(
          userId: 2,
          username: 'user2',
          email: 'user2@example.com',
          firstname: 'User2',
          lastname: 'Two',
        ),
      ];

      when(mockUserDataProvider.getAllUsers()).thenAnswer((_) async => users);

      final fetchedUsers = await userNotifier.getAllUsers();

      expect(fetchedUsers, equals(users));
    });

    test('deleteProfileByUserId deletes profile by userId', () async {
      final targetUserId = 2;

      when(mockUserDataProvider.deleteProfileByUserId(targetUserId))
          .thenAnswer((_) async {});

      await userNotifier.deleteProfileByUserId(targetUserId);

      verify(mockUserDataProvider.deleteProfileByUserId(targetUserId))
          .called(1);
    });
  });
}
