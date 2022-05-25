part of '../location_selection.dart';

class LocationSelectionController extends ChangeNotifier {
  late LocationSelectionState _state;
  late String _text;

  LocationSelectionController({LocationSelectionState? state, String? text})
      : _state =
            (state != null) ? state : LocationSelectionState.unknownAddress,
        _text = (text != null) ? text : "";

  LocationSelectionState get state => _state;
  String get text => _text;

  void setState({
    required LocationSelectionState state,
    required String text,
  }) {
    _state = state;
    _text = text;
    notifyListeners();
  }
}
