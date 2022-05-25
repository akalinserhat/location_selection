part of '../location_selection.dart';

class LocationSelection extends StatefulWidget {
  final LocationSelectionController controller;
  final double height;
  final double iconSize;
  final Color color;
  final Color iconColor;
  final BoxDecoration boxDecoration;
  final TextStyle textStyle;
  final IconData leadingIcon;
  final IconData refreshIcon;
  final IconData addIcon;
  final Function()? onTapLeadingIcon;
  final Function(LocationSelectionState state)? onTapText;
  final Function()? onTapRefreshIcon;
  final Function()? onTapAddIcon;

  const LocationSelection({
    Key? key,
    required this.controller,
    this.height = 45,
    this.iconSize = 20,
    this.color = Colors.blueAccent,
    this.iconColor = Colors.white,
    this.boxDecoration = const BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    this.textStyle = const TextStyle(color: Colors.white),
    this.leadingIcon = Icons.pin_drop,
    this.refreshIcon = Icons.refresh,
    this.addIcon = Icons.add,
    this.onTapLeadingIcon,
    this.onTapText,
    this.onTapRefreshIcon,
    this.onTapAddIcon,
  }) : super(key: key);

  @override
  State<LocationSelection> createState() => _LocationSelectionState();
}

class _LocationSelectionState extends State<LocationSelection> {
  LocationSelectionController get controller => widget.controller;
  Color get iconColor => widget.iconColor;
  Color get color => widget.color;
  double get height => widget.height;
  BoxDecoration get boxDecoration => widget.boxDecoration;
  IconData get leadingIcon => widget.leadingIcon;
  IconData get refreshIcon => widget.refreshIcon;
  IconData get addIcon => widget.addIcon;
  Function()? get onTapLeadingIcon => widget.onTapLeadingIcon;
  Function()? get onTapRefreshIcon => widget.onTapRefreshIcon;
  Function()? get onTapAddIcon => widget.onTapAddIcon;
  Function(LocationSelectionState state)? get onTapText => widget.onTapText;
  TextStyle get textStyle => widget.textStyle;

//************ Functions ************//
  void onChange() => setState(() {});

  //************ Widgets ************//
  Widget _leadingIconButton() {
    return IconButton(
        onPressed:
            (onTapLeadingIcon != null) ? () => onTapLeadingIcon!() : null,
        icon: Icon(leadingIcon, color: iconColor));
  }

  Widget _refreshIconButton() {
    return IconButton(
        onPressed:
            (onTapRefreshIcon != null) ? () => onTapRefreshIcon!() : null,
        icon: Icon(refreshIcon, color: iconColor));
  }

  Widget _addIconButton() {
    return IconButton(
        onPressed: (onTapAddIcon != null) ? () => onTapAddIcon!() : null,
        icon: Icon(addIcon, color: iconColor));
  }

  Widget _refreshIndicator() {
    return CircularProgressIndicator(color: iconColor);
  }

  Widget _text() {
    return TextButton(
        onPressed:
            (onTapText != null) ? () => onTapText!(controller.state) : null,
        child: Text(controller.text, style: textStyle));
  }

  //************ Contents ************//
  Widget _refreshStateContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _leadingIconButton(),
        Expanded(child: Center(child: _refreshIndicator()))
      ],
    );
  }

  Widget _unknownAddressContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _leadingIconButton(),
        _text(),
        _addIconButton(),
      ],
    );
  }

  Widget _knownAddressContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _leadingIconButton(),
        _text(),
        _refreshIconButton(),
      ],
    );
  }

  Widget _content() {
    switch (controller.state) {
      case LocationSelectionState.refreshing:
        return _refreshStateContent();

      case LocationSelectionState.unknownAddress:
        return _unknownAddressContent();

      case LocationSelectionState.knownAddress:
        return _knownAddressContent();
    }
  }

  @override
  void initState() {
    controller.addListener(() => onChange());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: boxDecoration,
      child: _content(),
    );
  }
}
