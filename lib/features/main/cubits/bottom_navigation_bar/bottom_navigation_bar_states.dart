abstract class BottomNavigationBarStates {}
class BottomNavigationBarInitial extends BottomNavigationBarStates {}
class BottomNavigationBarChangedState extends BottomNavigationBarStates {
  final int index;
  BottomNavigationBarChangedState({required this.index});
}