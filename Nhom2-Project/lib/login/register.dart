import 'package:doan/com/my_button.dart';
import 'package:doan/com/my_textfield.dart';
import 'package:doan/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _comfirmPasswordTextController = TextEditingController();

  void signUpButton() async {
    // try sign in
    try {
      if (_passwordTextController.text == _comfirmPasswordTextController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text,
        );
      } else {
        // showErrorMessage('Mật khẩu không chính xác');
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Mật khẩu không chính xác'),
            );
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Vui lòng nhập email và mật khẩu'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Đăng ký',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor('CB2B93'),
          hexStringToColor('9546C4'),
          hexStringToColor('5E61F4'),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Vui lòng điền Email, mật khẩu, nhập lại mật khẩu tại đây',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    controller: _emailTextController,
                    hintText: 'Email',
                    obscureText: false,
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Colors.white70,
                    )),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    controller: _passwordTextController,
                    hintText: 'Mật khẩu',
                    obscureText: true,
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.white70,
                    )),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    controller: _comfirmPasswordTextController,
                    hintText: 'Nhập lại mật khẩu',
                    obscureText: true,
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.white70,
                    )),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  text: 'Đăng ký',
                  onTap: signUpButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
