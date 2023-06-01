import 'package:flutter/material.dart';

class TextFieldComponent extends StatefulWidget {
  final Widget? icon;
  final bool? hasPadding;
  final String? label;
  final String? placeHolder;
  final String? background;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final bool? hideText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final bool readOnly;
  final void Function()? onTap;
  const TextFieldComponent(
      {Key? key,
      this.icon,
      this.hasPadding,
      this.label,
      required this.placeHolder,
      this.background,
      required this.controller,
      this.validator,
      this.autoValidateMode,
      this.hideText = false,
      this.keyboardType,
      this.focusNode,
      this.onFieldSubmitted,
      this.textInputAction,
      this.suffixIcon,
      this.onChanged,
      this.readOnly = false,
      this.onTap})
      : super(key: key);

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  final FocusNode _focusNode = FocusNode();
  bool _obscureText = true;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label ?? '',
            style: const TextStyle(color: Color(0xFF8B8B8B)),
          ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          readOnly: widget.readOnly,
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          obscureText: widget.hideText! && _obscureText,
          cursorColor: Colors.blue,
          validator: widget.validator,
          autovalidateMode: widget.autoValidateMode,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          decoration: InputDecoration(
            contentPadding: (widget.hasPadding ?? false)
                ? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0)
                : null,
            prefixIcon: widget.icon,
            suffixIcon: widget.hideText!
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            suffixIconColor: const Color(0xFF8B8B8B),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: widget.placeHolder,
            labelStyle:
                TextStyle(color: const Color(0xFF8B8B8B).withOpacity(0.6)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(color: Colors.blue)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(color: Colors.blue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(color: Colors.blue)),
          ),
        ),
      ],
    );
  }
}
