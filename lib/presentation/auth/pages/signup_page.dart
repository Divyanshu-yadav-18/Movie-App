// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:movie_app/common/helper/message/display_message.dart';
// import 'package:movie_app/common/helper/navigation/app_navigation.dart';
// import 'package:movie_app/core/configs/theme/app_color.dart';
// import 'package:movie_app/data/auth/models/signup_req_param.dart';
// import 'package:movie_app/domain/auth/usecases/signup.dart';
// import 'package:movie_app/presentation/auth/pages/signin_page.dart';
// import 'package:movie_app/presentation/home/pages/home_page.dart';
// import 'package:movie_app/service_locator.dart';
// import 'package:reactive_button/reactive_button.dart';

// class SignUpPage extends StatelessWidget {
//   SignUpPage({super.key});

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         minimum: const EdgeInsets.only(
//           top: 100,
//           right: 16,
//           left: 16,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             _signupText(),
//             const SizedBox(height: 30),
//             _emailField(),
//             const SizedBox(height: 10),
//             _pwField(),
//             const SizedBox(height: 60),
//             _signupButton(context),
//             const SizedBox(height: 20),
//             _signUpText(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _signupText() {
//     return const Text(
//       'Sign Up',
//       style: TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 24,
//       ),
//     );
//   }

//   Widget _emailField() {
//     return TextField(
//       controller: _emailController,
//       decoration: const InputDecoration(hintText: 'Email'),
//     );
//   }

//   Widget _pwField() {
//     return TextField(
//       controller: _passwordController,
//       decoration: const InputDecoration(hintText: 'Password'),
//     );
//   }

//   Widget _signupButton(BuildContext context) {
//     return ReactiveButton(
//       title: 'Sign Up',
//       activeColor: AppColor.primary,
//       onPressed: () async {
//         await sl<SignUpUseCase>().call(
//           params: SignupReqParam(
//             email: _emailController.text,
//             password: _passwordController.text,
//           ),
//         );
//       },
//       onSuccess: () {
//         AppNavigator.pushAndRemove(context, const HomePage());
//       },
//       onFailure: (error) {
//         DisplayMessage.errorMessage(error, context);
//       },
//     );
//   }

//   Widget _signUpText(BuildContext context) {
//     return Text.rich(
//       TextSpan(
//         children: [
//           const TextSpan(text: "Do you have an account?"),
//           TextSpan(
//             text: ' SignIn ',
//             style: const TextStyle(
//               color: Colors.blue,
//             ),
//             recognizer: TapGestureRecognizer()
//               ..onTap = () {
//                 AppNavigator.push(
//                   context,
//                   SignInPage(),
//                 );
//               },
//           ),
//         ],
//       ),
//     );
//   }
// }
