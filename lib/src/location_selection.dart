part of '../location_selection.dart';

class LocationSelection extends StatelessWidget {
  final Widget text;
  final Widget leadingIcon;
  final Widget prefixIcon;
  final double height;
  final double iconSize;
  final Color color;
  final BoxDecoration boxDecoration;

  const LocationSelection({
    Key? key,
    required this.text,
    this.leadingIcon = const IconButton(
        onPressed: null,
        icon: CircleAvatar(
            backgroundColor: Colors.transparent, child: Icon(Icons.gps_fixed))),
    this.prefixIcon = const IconButton(
        onPressed: null,
        icon: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(Icons.keyboard_arrow_down))),
    this.height = 55,
    this.iconSize = 20,
    this.color = Colors.blueAccent,
    this.boxDecoration = const BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(10))),
  }) : super(key: key);

  Widget _content(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 50, child: leadingIcon),
        SizedBox(width: size.width - 132, child: text),
        SizedBox(width: 50, child: prefixIcon),
      ],
    );
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
