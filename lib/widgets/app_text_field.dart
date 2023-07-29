import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:power_detector/utils/dimensions.dart';
import 'package:power_detector/utils/theme.dart';


// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final String type;
  final int maxLength;
  bool isObscure;
  bool isInner;

  AppTextField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.type = 'null',
    this.maxLength = 50,
    this.isObscure = false,
    this.isInner = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      // decoration: BoxDecoration(color: Colors.white,
      //     // border: Border.all(color: Themes.blueColor100),
      //     // borderRadius: BorderRadius.circular(Dimensions.height(5)),
      //     boxShadow: [
      //       BoxShadow(
      //           blurRadius: 3,
      //           spreadRadius: 1,
      //           offset: Offset(1, 1),
      //           color: context.theme.shadowColor,)
      //     ]
      //     ),
      // elevation: 3.0,
      // shadowColor: Themes.blueColor100,

      child: TextField(
        keyboardType: (widget.type == 'number')
            ? TextInputType.number
            : (widget.type == 'emailAddress')
                ? TextInputType.emailAddress
                : (widget.type == 'datetime')
                    ? TextInputType.datetime
                    : (widget.type == 'phone')
                        ? TextInputType.phone
                        : null,
        //number emailAddress  datetime  phone
        obscureText: widget.isObscure ? _obscureText : false,
        controller: widget.textController,
        autocorrect: false,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.maxLength),
        ],

        // keyboardType: TextInputType.number,

        // enableInteractiveSelection: true,
        decoration: InputDecoration(
          // floatingLabelStyle: TextStyle(
          //   color: Colors.red
          // ),
          counterText: "",
          hintText: widget.hintText,
          filled: true, //<-- SEE HERE
          fillColor:
              Get.isDarkMode ? Colors.black38 : Colors.grey.withOpacity(0.2),
          prefixIcon: Icon(
            widget.icon,
            color: Themes.greenColor300,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: Dimensions.height(10),
            horizontal: Dimensions.height(10),
          ), // <-- SEE HERE
          suffixIcon: widget.isObscure
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Themes.blueColor100,
                  ),
                )
              : null,

          focusedBorder: widget.isInner
              ? UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Themes.greenColor200),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.height(5)),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Themes.greenColor200,
                  ),
                ),

          enabledBorder: widget.isInner
              ? UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 0, color: Colors.white.withOpacity(0.2)),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.height(5)),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Themes.blueColor100,
                  ),
                ),
          border: widget.isInner
              ? const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ))
              // filled: true,
              // hintStyle: TextStyle(color: Colors.grey[800]),
              // hintText: "Type in your text",
              // fillColor: Colors.white70),

              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.height(5)),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Themes.greenColor100,
                  ),
                ),
        ),
      ),
    );
  }
}
