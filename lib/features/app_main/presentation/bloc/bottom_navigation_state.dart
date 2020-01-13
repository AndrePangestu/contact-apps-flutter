abstract class BottomNavigationState {}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

class ContactListPageLoaded extends BottomNavigationState {
  @override
  String toString() => 'ContactListPageLoaded';
}

class ContactMapsPageLoaded extends BottomNavigationState {
  @override
  String toString() => 'ContactMapsPageLoaded';
}