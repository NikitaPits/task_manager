import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_controller_event.dart';
part 'page_controller_state.dart';

class PageControllerBloc extends Bloc<PageControllerEvent, PageControllerState> {
  PageControllerBloc() : super(PageControllerInitial()) {
    on<PageControllerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
