import 'package:bloc_loginform_demo/login/bloc/login_bloc.dart';
import 'package:bloc_loginform_demo/login/bloc/login_event.dart';
import 'package:bloc_loginform_demo/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 150,
            child: const Padding(
              padding: EdgeInsets.all(30.0),
              child: Align(
                alignment: Alignment.topLeft,
              ),
            ),
          ),
          Container(
            height: 500,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  BlocBuilder<LoginBloc, LoginInState>(
                      builder: (context, state) {
                    if (state is LoginInErrorState) {
                      return Text(state.errorMessage,
                          style: const TextStyle(color: Colors.white));
                    } else {
                      return Container();
                    }
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  // Note: Same code is applied for the TextFormField as well
                  TextField(
                    controller: emailController,
                    onChanged: (val) {
                      BlocProvider.of<LoginBloc>(context).add(
                          LoginTextChangedEvent(
                              emailController.text, passwordController.text));
                    },
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Enter your Email address",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.white), //<-- SEE HERE
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                    onChanged: (val) {
                      BlocProvider.of<LoginBloc>(context).add(
                          LoginTextChangedEvent(
                              emailController.text, passwordController.text));
                    },
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.white), //<-- SEE HERE
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: BlocBuilder<LoginBloc, LoginInState>(
                          builder: (context, state) {
                        if (state is LoginInLoadingState) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                                backgroundColor: (state is LoginInValidState)
                                    ? Colors.white
                                    : Colors.grey),
                            onPressed: () {
                              if (state is LoginInValidState) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    LoginTextChangedEvent(emailController.text,
                                        passwordController.text));
                              }
                            },
                            child: const Text(
                              "Log In",
                            ));
                      })),
                ],
              ),
            ),
          )
        ],
      ),
    ));


  }
}
