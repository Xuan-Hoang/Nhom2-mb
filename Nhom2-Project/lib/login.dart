import 'package:demo/forgot_password.dart';
import 'package:demo/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _hidePassword = true;
  IconData icon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PC'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Đăng nhập',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.red,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: _hidePassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Nhập mật khẩu',
                  labelText: 'Mật khẩu',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(
                        () {
                          _hidePassword = !_hidePassword;
                          icon = _hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off;
                        },
                      );
                    },
                    icon: Icon(icon),
                  ),
                  prefixIcon: const Icon(
                    Icons.key,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Đăng nhập'),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Forgotpassword(),
                          ),
                        );
                      },
                      child: const Text(
                        'Quên mật khẩu ?',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ),
                        );
                      },
                      child: const Text(
                        'Đăng ký',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
