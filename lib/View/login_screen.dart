import 'package:flutter/material.dart';
import 'package:mvvm_app/Resources/Components/eleveted_button.dart';
import 'package:mvvm_app/Utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: const Text(
            'Login Page',
            style: TextStyle(color: Colors.white),
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
                valueListenable:  obseciverPassword,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return  TextField(
                  obscureText: obseciverPassword.value,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                    ),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(  
                      onTap: () => obseciverPassword.value =! obseciverPassword.value,
                      child: obseciverPassword.value ? const Icon(Icons.visibility_off_outlined): const Icon(Icons.visibility_outlined)),
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
              title: 'Login',
              onPress: () {
                if(emailController.text.isEmpty){
                  Utils.flashBarErrormessage('Please enter Email', context);
                }
                else if(passwordController.text.isEmpty){
                  Utils.flashBarErrormessage('Please enter Password', context);
                }
                else if(passwordController.text.length < 6){
                  Utils.flashBarErrormessage('Please enter 6 digit password', context);
                }
                else{
                  // ignore: avoid_print
                  print('API hit');
                }
              },
             )
            ],
          ),
        ),
      ),
    );
  }
}
