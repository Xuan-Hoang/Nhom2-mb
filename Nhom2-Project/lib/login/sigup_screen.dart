// import 'package:flutter/material.dart';

// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:mvvm_sqlite_demo/ui/login/login_screen.dart';
// import 'package:mvvm_sqlite_demo/ui/login/login_view_model.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:mvvm_sqlite_demo/ui/major/major_screen.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:mvvm_sqlite_demo/model/login.dart';

// import '/utils/app_variables.dart';

// import '/utils/prefs.dart';

// class SigupScreen extends StatelessWidget {
//   Widget build(BuildContext context) {
//     @override
//     final _formKey = GlobalKey<FormBuilderState>();
//     final loginViewModel = LoginViewModel();

//     void loginAction(var context, LoginViewModel model) async {}

//     final _loginNameController = TextEditingController();
//     final _loginPasswordController = TextEditingController();
//     Future<void> _showEditDialog(var context, LoginViewModel model,
//         {Login? login}) async {
//       _formKey.currentState!.save();
//       if (_formKey.currentState!.validate()) {
//         var formValue = _formKey.currentState!.value;
//         final username = formValue['username'].toString();
//         final password = formValue['password'].toString();
//         final result = await model.login(username, password);
//         if (result != null) {
//           AppVariables.userInfo = result;
//           Prefs.setUsername(username);
//           Prefs.setPassword(password);
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(
//           //     builder: (context) => LoginScreen(),
//           //   ),
//           // );
//         } else {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(const SnackBar(content: Text('ERROR')));
//         }
//       }
//       login ??= Login(username: '', password: '');
//       _loginNameController.text = login.username;
//       _loginPasswordController.text = login.password;

//       onPressed:
//       () {
//         Navigator.pop(context);
//         login!.username = _loginNameController.text.trim();
//         login.password = _loginPasswordController.text.trim();
//         model.add(login);
//       };
//     }

//     return ScopedModel(
//       model: loginViewModel,
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 margin: const EdgeInsets.all(16),
//                 child: FormBuilder(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       FormBuilderTextField(
//                         controller: _loginNameController,
//                         name: 'usename',
//                         decoration: const InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'Username'),
//                         validator: FormBuilderValidators.required(),
//                         keyboardType: TextInputType.text,
//                       ),
//                       FormBuilderTextField(
//                         controller: _loginPasswordController,
//                         name: 'password',
//                         decoration: const InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'Password'),
//                         validator: FormBuilderValidators.required(),
//                         keyboardType: TextInputType.text,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                   onPressed: () => _showEditDialog(context, loginViewModel),
//                   child: const Text('Sigup'))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:mvvm_sqlite_demo/ui/login/login_screen.dart';
// import 'package:path/path.dart';

// class SigupScreen extends StatelessWidget {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   Future<void> _submit() async {
//     final response = await http.post(
//       Uri.parse('https://64784c45362560649a2d8172.mockapi.io/mobile/api/login'),
//       body: {'username': usernameController.text, 'password': passwordController.text},
//     );
//     var context;
//     if () {
//       print('Đăng nhập không thành công!');
//     } else {
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => LoginScreen()),
//       // );
//       print(response.body);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Đăng Ký'),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: usernameController,
//             decoration: const InputDecoration(
//               labelText: 'UserName',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 16),
//           TextField(
//             controller: passwordController,
//             decoration: const InputDecoration(
//               labelText: 'Password',
//               border: OutlineInputBorder(),
//             ),
//             obscureText: true,
//           ),
//           SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: _submit,
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SigupScreen extends StatefulWidget {
  @override
  _SigupScreenState createState() => _SigupScreenState();
}

class _SigupScreenState extends State<SigupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signup() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      // Hiển thị thông báo lỗi nếu các trường dữ liệu rỗng
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Lỗi đăng ký'),
          content: Text('Vui lòng nhập đầy đủ thông tin.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      final response = await http.post(
        Uri.parse(
            'https://64784c45362560649a2d8172.mockapi.io/mobile/api/login'),
        body: jsonEncode({
          'username': _usernameController.text,
          'passowrd': _passwordController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode != 200) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('đăng ký thành công'),
            content: Text('Đăng ký thành công'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
        print(response.body);
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _signup,
                child: Text('Đăng ký'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
