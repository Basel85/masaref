abstract class SwitchButtonStates {}
class SwitchButtonInitialState extends SwitchButtonStates {}
class SwitchButtonChangedState extends SwitchButtonStates {
  final bool value;
  SwitchButtonChangedState({required this.value});
}