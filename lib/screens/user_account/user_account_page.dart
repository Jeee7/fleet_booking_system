// User Account Setup UI and BLoC
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/user_account/user_account_bloc.dart';

class UserAccountPage extends StatelessWidget {
  const UserAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserAccountBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('User Account Setup')),
        body: const UserAccountForm(),
      ),
    );
  }
}

class UserAccountForm extends StatelessWidget {
  const UserAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(decoration: const InputDecoration(labelText: 'Name')),
          TextField(decoration: const InputDecoration(labelText: 'Email')),
          TextField(decoration: const InputDecoration(labelText: 'Phone')),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Dummy submit
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Account Created (Dummy)')),
              );
            },
            child: const Text('Create Account'),
          ),
        ],
      ),
    );
  }
}
