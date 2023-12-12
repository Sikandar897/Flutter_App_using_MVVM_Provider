import 'package:flutter/material.dart';
import 'package:mvvm_app/Resources/colors.dart';
class ElevetedButton extends StatelessWidget {

  final String title;
    final bool loading;
    final VoidCallback onPress;

  const ElevetedButton({super.key, 
                      required this.title, 
                      this.loading = false, 
                      required this.onPress
                      
                      });
    
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
                  onPressed: onPress,
                  style: ButtonStyle(
                    fixedSize: const MaterialStatePropertyAll(Size(100, 50)),
                    shadowColor:
                        MaterialStatePropertyAll(AppColors.deepPurpleShade100),
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.deepPurple),
                    overlayColor:
                        MaterialStatePropertyAll(AppColors.deepPurpleShade400),
                    elevation: const MaterialStatePropertyAll(21),
                  ),
                  child: loading ? const CircleAvatar() : Text(
                    title,
                    style: const TextStyle(color:AppColors.whiteColor),
                  ));
  }
}