abstract class CheckBoxStates {}
class CheckBoxInitialState extends CheckBoxStates {}
class CheckBoxChangedState extends CheckBoxStates {
  final bool isChecked;
  CheckBoxChangedState({required this.isChecked});
}