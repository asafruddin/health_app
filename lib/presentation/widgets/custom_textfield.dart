import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.label,
      this.hintText,
      this.suffixIcon,
      this.controller,
      this.onChanged,
      this.obscureText})
      : super(key: key);

  final Widget? label;
  final String? hintText;
  final Widget? suffixIcon;

  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DefaultTextStyle(
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w600),
            child: label ?? const SizedBox()),
        SizedBox(height: label == null ? 0 : 10.0),
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: const Offset(0, 10),
                    color: Colors.grey.shade100)
              ]),
          child: TextFormField(
            controller: controller,
            style: Theme.of(context).textTheme.bodyMedium,
            onChanged: onChanged,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey.shade400),
              border: inputBorder,
              enabledBorder: inputBorder,
              focusedBorder: inputBorder,
              focusedErrorBorder: inputBorder,
              errorBorder: inputBorder,
              disabledBorder: inputBorder,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
