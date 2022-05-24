part of '../location_selection.dart';

enum LocationSelectionState { refreshing, unknownAddress, knownAddress }

class LocationSelection extends StatefulWidget {
  final double height; // = 45;
  final double iconSize;
  final Color color; // = Colors.blue;
  final Color iconColor;
  final BoxDecoration boxDecoration;
  final TextStyle textStyle;
  final IconData leadingIcon;
  final IconData refreshIcon;
  final IconData addIcon;
  final Function onTapLeadingIcon;
  final Function(LocationSelectionState state) onTapText;
  final Function onTapRefreshIcon;
  final Function onTapAddIcon;

  const LocationSelection({
    Key? key,
    this.height = 45,
    this.iconSize = 20,
    this.color = Colors.blueAccent,
    this.iconColor = Colors.white,
    this.boxDecoration = const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    this.textStyle = const TextStyle(color: Colors.white),
    this.leadingIcon = Icons.pin_drop,
    this.refreshIcon = Icons.refresh,
    this.addIcon = Icons.add,
    required this.onTapLeadingIcon,
    required this.onTapText,
    required this.onTapRefreshIcon,
    required this.onTapAddIcon,
  }) : super(key: key);

  @override
  State<LocationSelection> createState() => _LocationSelectionState();
}

class _LocationSelectionState extends State<LocationSelection> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
