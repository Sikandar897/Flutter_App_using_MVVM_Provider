import 'package:flutter/material.dart';
import 'package:mvvm_app/Resources/Components/eleveted_button.dart';
import 'package:mvvm_app/Utils/Routes/routes_name.dart';
import 'package:mvvm_app/Utils/utils.dart';
import 'package:mvvm_app/View_Model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  //variable for toggling passwored
  static ValueNotifier<bool> obseciverPassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /* Its used for */
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    //when this screen is gone the below thing will be dispose which will relase your RAM.

    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    obseciverPassword.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'SignUP'
          ),
          backgroundColor: Colors.deepPurple),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                    ),
                    label: Text('Email'),
                    hintText: 'Enter Your Email'),

                /*below is code for As user enter some text in one field and hit enter it will redirect him to next field*/

                onSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              const SizedBox(
                height: 21,
              ),
              ValueListenableBuilder(
                valueListenable: obseciverPassword,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return TextField(
                    obscureText: obseciverPassword.value,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(21)),
                      ),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                          onTap: () => obseciverPassword.value =
                              !obseciverPassword.value,
                          child: obseciverPassword.value
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined)),
                      label: const Text('Password'),
                      hintText: 'Enter Your Password',
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 21,
              ),
              ElevetedButton(
                title: 'Sign Up',
                loading: authViewModel.signUpLoading,
                onPress: () {
                  if (emailController.text.isEmpty) {
                    Utils.flashBarErrormessage('Please enter Email', context);
                  } else if (passwordController.text.isEmpty) {
                    Utils.flashBarErrormessage(
                        'Please enter Password', context);
                  } else if (passwordController.text.length < 6) {
                    Utils.flashBarErrormessage(
                        'Please enter 6 digit password', context);
                  } else {
                    Map data = {
                      'email': emailController.text.toString(),
                      'password': passwordController.text.toString()
                    };
                    authViewModel.signUpApi(data, context);
                    // ignore: avoid_print
                    print('API HIT');
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .02),
              Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      const SizedBox(width: 5,), 
                       InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.login);
                        },
                        child: const Text("login", style: TextStyle(color: Colors.deepPurple))),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}