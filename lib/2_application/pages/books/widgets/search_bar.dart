import 'package:flutter/material.dart';

class SearchBarField extends StatelessWidget {
  SearchBarField({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Search book name..',
              labelStyle: themeData.textTheme.subtitle2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: const BorderSide(width: 2.0, color: Color(0xFFBDBDBD)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: const BorderSide(width: 2.0, color: Color(0xFFBDBDBD)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7.0),
                borderSide: const BorderSide(width: 2.0, color: Color(0xFFBDBDBD)),
              ),
              prefixIcon: const Icon(Icons.search),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        ),
    );
  }
}
