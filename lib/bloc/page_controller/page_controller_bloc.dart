import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/page_model.dart';

part 'page_controller_event.dart';
part 'page_controller_state.dart';

class PageControllerBloc extends Bloc<PageControllerEvent, PageModel> {
  PageControllerBloc() : super(PageModel(PageController(), 0, 0)) {
    on<JumpToPageEvent>((event, emit) {
      int lastTabIndex = state.pageIndex;
      state.controller.animateToPage(
        event.pageIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
      emit(
        state.copyWith(
          pageIndex: event.pageIndex,
          lastTabIndex: lastTabIndex,
        ),
      );
    });
  }
}
