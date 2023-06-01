import 'package:doan/home_screen.dart';
import 'package:doan/login/forgot_password.dart';
import 'package:doan/login/register.dart';
import 'package:doan/login/sigup_screen.dart';
import 'package:doan/ui/login/login_view_model.dart';
import 'package:doan/ui/major/major_screen.dart';
import 'package:doan/utils/app_variables.dart';
import 'package:doan/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    final loginViewModel = LoginViewModel();

    void loginAction(var context, LoginViewModel model) async {
      _formKey.currentState!.save();
      if (_formKey.currentState!.validate()) {
        var formValue = _formKey.currentState!.value;
        final username = formValue['email'].toString();
        final password = formValue['password'].toString();
        final result = await model.login(username, password);
        if (result != null) {
          AppVariables.userInfo = result;
          Prefs.setUsername(username);
          Prefs.setPassword(password);

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
              (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Email hoặc mật khẩu không đúng!')));
        }
      }
    }

    return ScopedModel(
      model: loginViewModel,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: const BoxConstraints.expand(),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/hinhnenlogin.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.7)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Text(
                  'LURGEAR',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: FormBuilder(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'email',
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Email'),
                          validator: FormBuilderValidators.required(),
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        FormBuilderTextField(
                          name: 'password',
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Mật khẩu'),
                          validator: FormBuilderValidators.required(),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ],
                    )),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              //   child: Stack(
              //     alignment: AlignmentDirectional.centerEnd,
              //     children: const [
              //       TextField(
              //         style: TextStyle(fontSize: 18, color: Colors.black),
              //         obscureText: true,
              //         decoration: InputDecoration(
              //           labelText: 'Password',
              //           labelStyle:
              //               TextStyle(color: Colors.black, fontSize: 18),
              //         ),
              //       ),
              //       Text(
              //         'Show',
              //         style: TextStyle(color: Colors.red, fontSize: 18),
              //       )
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () => loginAction(context, loginViewModel),
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Forgotpassword(),
                              ));
                        },
                        child: const Text(
                          'Quên mật khẩu?',
                          style: TextStyle(color: Colors.black),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SigupScreen(),
                              ));
                        },
                        child: const Text('Đăng ký',
                            style: TextStyle(color: Colors.black))),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
