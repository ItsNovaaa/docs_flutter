import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fllutter_learn/blocs/bloc/login/login_bloc.dart';

// make widget for each screen

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Are you sure you want to logout?"),
                SizedBox(height: 25),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Dispatch the DeleteToken event to log out
                      context.read<LoginBloc>().add(DeleteToken());
                    },
                    child: const Text('Logout'),
                  ),
                ),
              ]),
        ));
  }
}
