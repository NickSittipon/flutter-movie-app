import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/resources/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onPress;
  const RoundButton({
    Key? key,
    required this.title,
    this.isLoading = false,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (onPress),
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 205, 0, 0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child:
              isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                    title,
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        ),
      ),
    );
  }
}
