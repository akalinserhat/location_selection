library location_selection;

import 'package:flutter/material.dart';

part 'package:location_selection/src/location_selection.dart';
part 'package:location_selection/src/location_selection_controller.dart';

enum LocationSelectionState {
  refreshing,
  problem,
  unknownAddress,
  knownAddress,
  merchant,
}
