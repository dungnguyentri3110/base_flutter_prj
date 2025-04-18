import 'package:flutter/material.dart';

class CommonDropdownState<T> {
  final int? selectedIndex;
  final bool? error;
  final String? errorMessage;
  final PopupMenuItem<T>? selected;

  CommonDropdownState({
    this.selected,
    this.error,
    this.errorMessage,
    this.selectedIndex,
  });

  CommonDropdownState<T> copy({
    int? selectedIndex,
    bool? error,
    String? errorMessage,
    PopupMenuItem<T>? selected,
  }) {
    return CommonDropdownState(
      selected: selected ?? this.selected,
      error: error ?? this.error,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
