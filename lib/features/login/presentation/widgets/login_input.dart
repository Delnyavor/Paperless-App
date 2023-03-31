import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginInput extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final bool? obscure;
  final void Function(String)? onChanged;
  final String? errorText;

  const LoginInput({
    Key? key,
    this.validator,
    required this.controller,
    required this.hint,
    this.obscure,
    this.onChanged,
    this.errorText,
  }) : super(key: key);

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  bool invisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: shouldObscure(),
      obscuringCharacter: '*',
      decoration: _decoration(),
      onChanged: widget.onChanged,
      style: const TextStyle(
          fontWeight: FontWeight.w600, color: Colors.black, fontSize: 12),
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      isDense: true,
      hintText: widget.hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical:
            getValueForScreenType(context: context, mobile: 20, desktop: 16),
      ),
      // suffixIcon: _iconBuilder(),
      errorText: widget.errorText,
    );
  }

  Widget _iconBuilder() {
    if (widget.obscure != null && widget.obscure == true) {
      return _suffixIcon();
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _suffixIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          invisible = !invisible;
        });
      },
      child: Icon(invisible ? Icons.visibility_off_outlined : Icons.visibility),
    );
  }

  bool shouldObscure() {
    if (widget.obscure != null && widget.obscure == true) {
      return invisible;
    } else {
      return false;
    }
  }
}
