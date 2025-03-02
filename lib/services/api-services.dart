import 'dart:convert';

import 'package:crud_riverpod/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// Changed new API because of initial api was reached to request limition.
const String apiURL =
    "https://crudcrud.com/api/f900ceab06af4c488c7eac7a2516b39e/users";

// Initial API
// const String apiURL =
//     "https://crudcrud.com/api/423447b29d9a43ebae60c99b0971fc5d/users";

class UserState {
  final List<User> users;
  final bool isLoading;
  final String? error;

  UserState({required this.users, this.isLoading = false, this.error});
}

// Riverpod provider for fetching users
final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState(users: [])) {
    fetchUsers();
  }

  //Fetch Users
  Future<void> fetchUsers() async {
    state = UserState(users: state.users, isLoading: true);
    try {
      final response = await http.get(Uri.parse(apiURL));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        state = UserState(
          users: data.map((e) => User.fromMap({...e, 'id': e['_id']})).toList(),
          isLoading: false,
        );
      } else {
        state = UserState(
          users: [],
          isLoading: false,
          error: "Failed to fetch users",
        );
      }
    } catch (e) {
      state = UserState(users: [], isLoading: false, error: e.toString());
    }
  }

  //Add User
  Future<void> addUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse(apiURL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': user.name,
          'age': user.age,
          'email': user.email,
        }),
      );
      if (response.statusCode == 201) {
        fetchUsers();
      }
    } catch (e) {
      state = UserState(
        users: state.users,
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  //Update User
  Future<void> updateUser(String id, User user) async {
    try {
      final response = await http.put(
        Uri.parse("$apiURL/$id"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': user.name,
          'age': user.age,
          'email': user.email,
        }),
      );
      if (response.statusCode == 200) {
        fetchUsers();
      }
    } catch (e) {
      state = UserState(
        users: state.users,
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  //Delete User
  Future<void> deleteUser(String id) async {
    try {
      final response = await http.delete(Uri.parse("$apiURL/$id"));
      if (response.statusCode == 200 || response.statusCode == 204) {
        fetchUsers();
      }
    } catch (e) {
      state = UserState(
        users: state.users,
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
