import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.isPassword,
    this.errorText,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final bool isPassword;
  final String? errorText;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          onChanged: (value) {
            setState(() {});
          },
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: const TextStyle(
              color: Color(0x66323232),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            contentPadding: const EdgeInsetsDirectional.fromSTEB(24, 24, 12, 16),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF1A7924),
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF1A7924),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            errorText: widget.errorText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    padding: const EdgeInsetsDirectional.symmetric(
                        vertical: 0, horizontal: 20),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0XFF1A7924),
                    ),
                  )
                : null,
            fillColor: Colors.white,
            filled: true,
          ),
        ),
        if (widget.errorText != null) // Exibe a mensagem de erro
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 5.0),
            child: Text(
              widget.errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
