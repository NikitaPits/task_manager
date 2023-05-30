part of 'page_controller_bloc.dart';

@immutable
abstract class PageControllerEvent {}

class JumpToPageEvent extends PageControllerEvent {
  final int pageIndex;
  JumpToPageEvent(this.pageIndex);
}
