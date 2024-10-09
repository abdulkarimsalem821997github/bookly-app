  import 'package:flutter/material.dart';

buildErrorSnackBar(String errorMessage) => SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 3),
      );