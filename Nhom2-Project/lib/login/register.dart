import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _hidePassword = true;
  IconData icon = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Tạo tài khoản',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Họ'),
                ),
                const SizedBox(height: 20),
                const TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Tên'),
                ),
                const SizedBox(height: 20),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.red,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Số điện thoại'),
                ),
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
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                      child: const Text('Đăng ký'),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Quay lại'),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
