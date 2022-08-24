part of '../location_selection.dart';

class LocationSelection extends StatelessWidget {
  final LocationSelectionState state;
  final String text;
  final String? merchantAvatarUrl;
  final double height;
  final double iconSize;
  final Color color;
  final Color iconColor;
  final BoxDecoration boxDecoration;
  final TextStyle textStyle;
  final IconData leadingIcon;
  final IconData refreshIcon;
  final IconData addIcon;
  final Function(BuildContext context)? onTapLeadingIcon;
  final Function(BuildContext context)? onTapText;
  final Function(BuildContext context)? onTapRefreshIcon;
  final Function(BuildContext context)? onTapAddIcon;

  const LocationSelection({
    Key? key,
    this.state = LocationSelectionState.refreshing,
    this.text = "",
    this.merchantAvatarUrl,
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

  factory LocationSelection.refreshing() {
    return const LocationSelection(
      state: LocationSelectionState.refreshing,
    );
  }

  factory LocationSelection.problem({
    required String text,
    required Function(BuildContext context) onTapText,
  }) {
    return LocationSelection(
      state: LocationSelectionState.problem,
      text: text,
      onTapText: onTapText,
    );
  }

  factory LocationSelection.unknownAddress({
    required String text,
    required Function(BuildContext context) onTapAddIcon,
  }) {
    return LocationSelection(
      state: LocationSelectionState.unknownAddress,
      text: text,
      onTapAddIcon: onTapAddIcon,
    );
  }

  factory LocationSelection.knownAddress({
    required String text,
    required Function(BuildContext context) onTapText,
    required Function(BuildContext context) onTapRefreshIcon,
  }) {
    return LocationSelection(
      state: LocationSelectionState.knownAddress,
      text: text,
      onTapText: onTapText,
      onTapRefreshIcon: onTapRefreshIcon,
    );
  }

  factory LocationSelection.merchant(
      {required String text,
      required String merchantAvatarUrl,
      required Function(BuildContext context) onTapMerchant}) {
    return LocationSelection(
      state: LocationSelectionState.merchant,
      text: text,
      onTapLeadingIcon: onTapMerchant,
    );
  }

  //************ Widgets ************//
  Widget _leadingIconButton(BuildContext context) {
    return IconButton(
        onPressed: (onTapLeadingIcon != null)
            ? () => onTapLeadingIcon!(context)
            : null,
        icon: Icon(leadingIcon, color: iconColor));
  }

  Widget _merchantAvatarIconButton(BuildContext context) {
    return IconButton(
        onPressed: (onTapLeadingIcon != null)
            ? () => onTapLeadingIcon!(context)
            : null,
        icon: CircleAvatar(
          backgroundImage: NetworkImage(merchantAvatarUrl!),
        ));
  }

  Widget _refreshIconButton(BuildContext context) {
    return IconButton(
        onPressed: (onTapRefreshIcon != null)
            ? () => onTapRefreshIcon!(context)
            : null,
        icon: Icon(refreshIcon, color: iconColor));
  }

  Widget _addIconButton(BuildContext context) {
    return IconButton(
        onPressed: (onTapAddIcon != null) ? () => onTapAddIcon!(context) : null,
        icon: Icon(addIcon, color: iconColor));
  }

  Widget _refreshIndicator() {
    return CircularProgressIndicator(color: iconColor);
  }

  Widget _text(BuildContext context) {
    return TextButton(
        onPressed: (onTapText != null) ? () => onTapText!(context) : null,
        child: Row(
          children: [
            Text(text, style: textStyle),
            Visibility(
              visible: (onTapText != null),
              child: const Icon(Icons.arrow_drop_down),
            )
          ],
        ));
  }

  //************ Contents ************//
  Widget _refreshStateContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _leadingIconButton(context),
        Expanded(child: Center(child: _refreshIndicator()))
      ],
    );
  }

  Widget _problemStateContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _leadingIconButton(context),
        _text(context),
        _refreshIconButton(context),
      ],
    );
  }

  Widget _unknownAddressContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _leadingIconButton(context),
        _text(context),
        _addIconButton(context),
      ],
    );
  }

  Widget _knownAddressContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _leadingIconButton(context),
        _text(context),
        _refreshIconButton(context),
      ],
    );
  }

  Widget _merchantContent(BuildContext context) {
    return Row(
      children: [
        (merchantAvatarUrl != null)
            ? _merchantAvatarIconButton(context)
            : _leadingIconButton(context),
        _text(context),
        _refreshIconButton(context),
      ],
    );
  }

  Widget _content(BuildContext context) {
    switch (state) {
      case LocationSelectionState.refreshing:
        return _refreshStateContent(context);

      case LocationSelectionState.problem:
        return _problemStateContent(context);

      case LocationSelectionState.unknownAddress:
        return _unknownAddressContent(context);

      case LocationSelectionState.knownAddress:
        return _knownAddressContent(context);

      case LocationSelectionState.merchant:
        return _merchantContent(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: boxDecoration,
      child: _content(context),
    );
  }
}

// class LocationSelection extends StatefulWidget {
//   // final LocationSelectionController controller;
//   final LocationSelectionState state;
//   final String text;
//   final double height;
//   final double iconSize;
//   final Color color;
//   final Color iconColor;
//   final BoxDecoration boxDecoration;
//   final TextStyle textStyle;
//   final IconData leadingIcon;
//   final IconData refreshIcon;
//   final IconData addIcon;
//   final Function(BuildContext context)? onTapLeadingIcon;
//   final Function(BuildContext context)? onTapText;
//   final Function(BuildContext context)? onTapRefreshIcon;
//   final Function(BuildContext context)? onTapAddIcon;

//   const LocationSelection({
//     Key? key,
//     required this.state,
//     required this.text,
//     this.height = 45,
//     this.iconSize = 20,
//     this.color = Colors.blueAccent,
//     this.iconColor = Colors.white,
//     this.boxDecoration = const BoxDecoration(
//         color: Colors.blueAccent,
//         borderRadius: BorderRadius.all(Radius.circular(10))),
//     this.textStyle = const TextStyle(color: Colors.white),
//     this.leadingIcon = Icons.pin_drop,
//     this.refreshIcon = Icons.refresh,
//     this.addIcon = Icons.add,
//     this.onTapLeadingIcon,
//     this.onTapText,
//     this.onTapRefreshIcon,
//     this.onTapAddIcon,
//   }) : super(key: key);

//   @override
//   State<LocationSelection> createState() => _LocationSelectionState();
// }

// class _LocationSelectionState extends State<LocationSelection> {
//   // LocationSelectionController get controller => widget.controller;
//   LocationSelectionState get state => widget.state;
//   String get text => widget.text;
//   Color get iconColor => widget.iconColor;
//   Color get color => widget.color;
//   double get height => widget.height;
//   BoxDecoration get boxDecoration => widget.boxDecoration;
//   IconData get leadingIcon => widget.leadingIcon;
//   IconData get refreshIcon => widget.refreshIcon;
//   IconData get addIcon => widget.addIcon;
//   Function(BuildContext context)? get onTapLeadingIcon =>
//       widget.onTapLeadingIcon;
//   Function(BuildContext context)? get onTapRefreshIcon =>
//       widget.onTapRefreshIcon;
//   Function(BuildContext context)? get onTapAddIcon => widget.onTapAddIcon;
//   Function(BuildContext context)? get onTapText => widget.onTapText;
//   TextStyle get textStyle => widget.textStyle;

// //************ Functions ************//
//   void onChange() => setState(() {});

//   //************ Widgets ************//
//   Widget _leadingIconButton() {
//     return IconButton(
//         onPressed:
//             (onTapLeadingIcon != null) ? () => onTapLeadingIcon!() : null,
//         icon: Icon(leadingIcon, color: iconColor));
//   }

//   Widget _refreshIconButton() {
//     return IconButton(
//         onPressed:
//             (onTapRefreshIcon != null) ? () => onTapRefreshIcon!() : null,
//         icon: Icon(refreshIcon, color: iconColor));
//   }

//   Widget _addIconButton() {
//     return IconButton(
//         onPressed: (onTapAddIcon != null) ? () => onTapAddIcon!() : null,
//         icon: Icon(addIcon, color: iconColor));
//   }

//   Widget _refreshIndicator() {
//     return CircularProgressIndicator(color: iconColor);
//   }

//   Widget _text() {
//     return TextButton(
//         onPressed:
//             (onTapText != null) ? () => onTapText!(controller.state) : null,
//         child: Text(text, style: textStyle));
//   }

//   //************ Contents ************//
//   Widget _refreshStateContent() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _leadingIconButton(),
//         Expanded(child: Center(child: _refreshIndicator()))
//       ],
//     );
//   }

//   Widget _unknownAddressContent() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _leadingIconButton(),
//         _text(),
//         _addIconButton(),
//       ],
//     );
//   }

//   Widget _knownAddressContent() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _leadingIconButton(),
//         _text(),
//         _refreshIconButton(),
//       ],
//     );
//   }

//   Widget _content(BuildContext context) {
//     switch (state) {
//       case LocationSelectionState.refreshing:
//         return _refreshStateContent();

//       case LocationSelectionState.unknownAddress:
//         return _unknownAddressContent();

//       case LocationSelectionState.knownAddress:
//         return _knownAddressContent();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       decoration: boxDecoration,
//       child: _content(context),
//     );
//   }
// }
