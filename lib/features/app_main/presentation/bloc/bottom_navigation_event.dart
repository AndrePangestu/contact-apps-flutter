class BottomNavigationEvent {}

class PageTapped extends BottomNavigationEvent {
  final int index;

  PageTapped({
    this.index
  });

  @override
  String toString() => 'PageTapped: $index';
}