import 'package:fllutter_learn/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fllutter_learn/blocs/bloc/login/login_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Padding(
        
        // backgroundColor: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginFailure) {
              _emailError = state.error;
              _passwordError = state.error;
            } 
            if (state is LoginSuccess) {
             // return text login success
             return Center(
               child: MyHomePage(),
             );
            }
            if (state is LoginInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              color: Colors.white,
                padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text(
                  'Silahkan Login Dengan Email Dan Password',
                  style: GoogleFonts.ibmPlexSans(
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),

                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: const OutlineInputBorder(),
                    errorText: _emailError,
                  ),
                ),
                SizedBox(height: 8),
                //add password input field
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    errorText: _passwordError,
                  ),
                ),
                //sized box
                SizedBox(height: 8),
                //add login button
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          //call login event
                          context.read<LoginBloc>().add(
                                LoginButtonPressed(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          foregroundColor:
                              Colors.white, // Change text color to white
                        ),
                        child: Text('Login'),
                      ),
                    ),
                  ],
                ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
