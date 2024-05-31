import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileriverpod/application/user/provider/user_riverpod_provider.dart';
import 'package:mobileriverpod/domain/user/model/update_user_model.dart';

class UserProfileWidget extends ConsumerWidget {
  UserProfileWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final userProfile = watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: userProfile == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: userProfile.username,
                      decoration: InputDecoration(labelText: 'Username'),
                      onSaved: (value) {
                        userProfile.username = value!;
                      },
                    ),
                    TextFormField(
                      initialValue: userProfile.email,
                      decoration: InputDecoration(labelText: 'Email'),
                      onSaved: (value) {
                        userProfile.email = value!;
                      },
                    ),
                    TextFormField(
                      initialValue: userProfile.firstname,
                      decoration: InputDecoration(labelText: 'First Name'),
                      onSaved: (value) {
                        userProfile.firstname = value!;
                      },
                    ),
                    TextFormField(
                      initialValue: userProfile.lastname,
                      decoration: InputDecoration(labelText: 'Last Name'),
                      onSaved: (value) {
                        userProfile.lastname = value!;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final updateDto = UpdateUserDto(
                            userId: userProfile.userId,
                            username: userProfile.username,
                            email: userProfile.email,
                            firstname: userProfile.firstname,
                            lastname: userProfile.lastname,
                          );
                          context.read(userProvider.notifier).updateUserProfile(updateDto);
                        }
                      },
                      child: Text('Update Profile'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read(userProvider.notifier).deleteUserProfile();
                      },
                      child: Text('Delete Profile'),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
