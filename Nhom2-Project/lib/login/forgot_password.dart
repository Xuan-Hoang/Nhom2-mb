import 'package:doan/com/my_button.dart';
import 'package:doan/com/my_textfield.dart';
import 'package:doan/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final _emailTextController = TextEditingController();
  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailTextController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text(
                'Một đường link đã gửi tới email của bạn, vui lòng kiểm tra hòm thư'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Email chưa được đăng ký hoặc đã gửi'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                20, MediaQuery.of(context).size.height * 0.3, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Vui lòng điền Email, chúng tôi sẽ gửi link reset password cho bạn',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    controller: _emailTextController,
                    hintText: 'Email đăng ký',
                    obscureText: false,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.white70,
                    )),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  text: 'Đặt lại mật khẩu',
                  onTap: passwordReset,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
