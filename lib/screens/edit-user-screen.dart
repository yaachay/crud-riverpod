import 'package:crud_riverpod/configs/configs.dart';
import 'package:crud_riverpod/models/models.dart';
import 'package:crud_riverpod/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditUserScreen extends ConsumerWidget {
  /// Set current user for editing mode
  final User? user;

  const EditUserScreen({super.key, this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    if (user != null) {
      nameController.text = user!.name;
      ageController.text = user!.age.toString();
      emailController.text = user!.email;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        iconTheme: IconThemeData(color: Palette.icon),
        title: Text(
          (user != null) ? 'Edit User: ${user!.id}' : 'Add User',
          style: TextStyle(color: Palette.text),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                label: Text('Name:'),
                hintText: 'Enter name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                label: Text('Age:'),
                hintText: 'Enter age',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text('Email:'),
                hintText: 'Enter email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 50),
            Center(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Palette.primary,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
                onPressed: () {
                  (user != null)
                      ? {
                        // Update user
                        ref
                            .read(userProvider.notifier)
                            .updateUser(
                              user!.id,
                              User(
                                id: '',
                                name: nameController.text,
                                age: int.parse(ageController.text),
                                email: emailController.text,
                              ),
                            )
                            .then((_) {
                              Navigator.of(context).pop();
                            }),
                      }
                      // Add new user
                      : {
                        ref
                            .read(userProvider.notifier)
                            .addUser(
                              User(
                                id: '',
                                name: nameController.text,
                                age: int.parse(ageController.text),
                                email: emailController.text,
                              ),
                            )
                            .then((_) {
                              Navigator.of(context).pop();
                            }),
                      };
                },
                child: Text((user != null) ? 'UPDATE USER' : 'ADD USER'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
