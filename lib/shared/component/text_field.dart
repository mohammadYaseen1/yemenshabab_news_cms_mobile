import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultFormField extends StatefulWidget {
  final TextEditingController? controller;
  final List<TextEditingController>? controllers;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? label;
  final String? hint;
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final bool isPassword;
  final bool enabled;
  final bool readOnly;
  final double radius;
  final int? maxLength;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final bool isEmailOrPhone;
  final List<IconData>? prefixIcons;
  final FocusNode? focusNode;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final Widget? suffix;
  final BorderRadius? borderRadius;
  final int maxLines;
  final bool autofocus;
  final Color? borderColor;
  final Color focusBorderColor;
  final Color textColor;

  static const Color defaultColor = Colors.black;

  const DefaultFormField({
    Key? key,
    this.controller,
    this.keyboardType,
    required String? this.validator(String? value)?,
    this.prefixIcon,
    this.onTap,
    this.suffixIcon,
    this.label,
    this.hint,
    this.onSubmit(value)?,
    this.onChange(value)?,
    this.isPassword = false,
    this.enabled = true,
    this.readOnly = false,
    this.radius = 4.0,
    this.maxLength,
    this.labelStyle,
    this.hintStyle,
    this.prefixText,
    this.prefixStyle,
    this.isEmailOrPhone = false,
    this.prefixIcons,
    this.controllers,
    this.focusNode,
    this.suffixText,
    this.suffixStyle,
    this.suffix,
    this.borderRadius,
    this.maxLines = 1,
    this.autofocus = false,
    this.borderColor,
    this.focusBorderColor = defaultColor,
    this.textColor = defaultColor,
  })  : assert(!isPassword || suffixIcon == null,
            '\n\nError: Cannot provide both an isPassword and a suffixIcon\n'),
        super(key: key);

  @override
  _DefaultFormFieldState createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  bool obscureText = true;
  bool isEmail = false;

  Color get defaultColor => DefaultFormField.defaultColor;

  @override
  Widget build(BuildContext context) {
    final _errorColor = Colors.red;

    return TextFormField(
      autofocus: widget.autofocus,
      maxLines: widget.maxLines,
      focusNode: widget.focusNode,
      style: TextStyle(
        color: widget.textColor,
      ),
      controller: widget.isEmailOrPhone
          ? widget.controllers![isEmail ? 0 : 1]
          : widget.controller,
      decoration: InputDecoration(
        counter: const Offstage(),
        errorStyle: TextStyle(
          color: _errorColor,
        ),
        labelStyle: widget.labelStyle,
        labelText: widget.isEmailOrPhone
            ? isEmail
                ? 'Email'
                : 'Phone'
            : widget.label,
        hintText: widget.hint,
        hintStyle: widget.hintStyle,
        prefixText: !isEmail ? widget.prefixText : null,
        suffixText: widget.suffixText,
        suffixStyle: widget.suffixStyle,
        prefixStyle: widget.prefixStyle,
        alignLabelWithHint: true,
        suffix: widget.suffix,
        prefixIcon: widget.isEmailOrPhone && widget.prefixIcons != null
            ? Icon(
                widget.prefixIcons![isEmail ? 0 : 1],
                color: defaultColor,
              )
            : widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: defaultColor,
                  )
                : null,
        suffixIcon: widget.isEmailOrPhone
            ? IconButton(
                color: defaultColor,
                onPressed: () => setState(() {
                  isEmail = !isEmail;
                  Fluttertoast.showToast(
                      msg: isEmail
                          ? 'sign up using your email'
                          : 'sign up using your phone number',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      fontSize: 16.0);
                  // widget.controller!.clear();
                }),
                icon: const Icon(FontAwesomeIcons.syncAlt),
              )
            : !widget.isPassword
                ? widget.suffixIcon == null
                    ? null
                    : Icon(
                        widget.suffixIcon,
                        color: defaultColor,
                      )
                : IconButton(
                    color: defaultColor,
                    onPressed: () => setState(() {
                      obscureText = !obscureText;
                    }),
                    icon: obscureText
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                  ),
        border: OutlineInputBorder(
          borderSide: widget.borderColor != null
              ? BorderSide(color: widget.borderColor!)
              : const BorderSide(color: Colors.grey),
          borderRadius:
              widget.borderRadius ?? BorderRadius.circular(widget.radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: widget.borderColor != null
              ? BorderSide(color: widget.borderColor!)
              : const BorderSide(color: Colors.grey),
          borderRadius:
              widget.borderRadius ?? BorderRadius.circular(widget.radius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.focusBorderColor,
            width: 2.0,
          ),
          borderRadius:
              widget.borderRadius ?? BorderRadius.circular(widget.radius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _errorColor,
            width: 2.0,
          ),
          borderRadius:
              widget.borderRadius ?? BorderRadius.circular(widget.radius),
        ),
      ),
      keyboardType: widget.isEmailOrPhone
          ? isEmail
              ? TextInputType.emailAddress
              : TextInputType.phone
          : widget.keyboardType,
      obscureText: widget.isPassword ? obscureText : false,
      validator: widget.validator,
      onChanged: widget.onChange,
      onFieldSubmitted: widget.onSubmit,
      onTap: widget.onTap,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      maxLength: widget.maxLength,
    );
  }
}
