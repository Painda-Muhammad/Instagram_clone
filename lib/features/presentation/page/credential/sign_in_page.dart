
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_app/consts.dart';
import 'package:instagram_clone_app/features/presentation/cubit/credentail/credential_cubit.dart';
import 'package:instagram_clone_app/features/presentation/widgets/button_container_widget.dart';
import 'package:instagram_clone_app/features/presentation/widgets/form_container_widget.dart';

import '../../cubit/auth/auth_cubit.dart';
import '../main_screen/main_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();

  bool _isSigningIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (credentialState is CredentialFailure) {
            toast("Invalid Email and Password");
          }
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return MainScreen(uid: authState.uid);
                } else {
                  return _bodyWidget();
                }
              },
            );
          }
          return _bodyWidget();
        },
      )
    );
  }

  _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Container(),
          ),
          Center(
              child: SvgPicture.asset(
                "assets/ic_instagram.svg",
                color: primaryColor,
              )),
          sizeVer(30),
          FormContainerWidget(
            controller: _emailController,
            hintText: "Email",
          ),
          sizeVer(15),
          FormContainerWidget(
            controller: _passwordController,
            hintText: "Password",
            isPasswordField: true,
          ),
          sizeVer(15),
          ButtonContainerWidget(
            color: blueColor,
            text: "log in",
            onTapListener: () {
              _signInUser();
            },
          ),
          sizeVer(10),
          _isSigningIn == true ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Please wait", style: TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w400),),
              sizeHor(10),
              const CircularProgressIndicator()
            ],
          ) : const SizedBox(width: 0, height: 0,),
          Flexible(
            flex: 2,
            child: Container(),
          ),
          const Divider(
            color: secondaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have and account? ",
                style: TextStyle(color: primaryColor),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, PageConst.signUpPage, (route) => false);
                  // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignUpPage()), (route) => false);
                },
                child: const Text(
                  "Sign Up.",
                  style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _signInUser() {
    setState(() {
      _isSigningIn = true;
    });
    BlocProvider.of<CredentialCubit>(context).signInUser(
      email: _emailController.text,
      password: _passwordController.text,
    ).then((value) => _clear());
  }

  _clear() {
    setState(() {
      _emailController.clear();
      _passwordController.clear();
      _isSigningIn = false;
    });
  }
}
