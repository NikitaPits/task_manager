import 'package:flutter/material.dart';

class PageModel {
  final PageController controller;
  int pageIndex;

  int lastTabIndex;

  PageModel(
    this.controller,
    this.pageIndex,
    this.lastTabIndex,
  );

  PageModel copyWith({
    PageController? controller,
    int? pageIndex,
    int? lastTabIndex,
  }) {
    return PageModel(
      controller ?? this.controller,
      pageIndex ?? this.pageIndex,
      lastTabIndex ?? this.lastTabIndex,
    );
  }
}
