
import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';


class CustomBottomIndicatorBar extends StatefulWidget {

  /// Creates a bottom navigation bar with a indicator on top of the selected '
  /// widget which is typically used as a
  /// [Scaffold]'s [Scaffold.bottomNavigationBar] argument.
  ///
  /// [elevation] argument must be non-null and non-negative.
  ///
  /// The length of [items] must be at least two and each item's icon and label
  /// must not be null.
  ///
  /// If [selectedLabelStyle], [unselectedLabelStyle], [selectedIconTheme] ,
  /// [unselectedIconTheme] values are non-null, they will be used instead
  /// of [activeColor] and [inactiveColor].
  ///
  /// If [activeColor] is null [BottomNavigationBarThemeData.selectedItemColor]
  /// is used. If [BottomNavigationBarThemeData.selectedItemColor] then
  /// [activeColor] default to [ThemeData.indicatorColor]
  ///
  /// If [inactiveColor] is null,
  /// [BottomNavigationBarThemeData.unselectedItemColor] is used.
  /// If [BottomNavigationBarThemeData.unselectedItemColor] is null,
  /// then [inactiveColor] defaults to [ThemeData.unselectedWidgetColor].
  ///
  /// If [indicatorColor] is null
  /// [BottomNavigationBarThemeData.selectedItemColor] is used. If
  /// [BottomNavigationBarThemeData.selectedItemColor] is null then
  /// [indicatorColor] defaults to [ThemeData.indicatorColor].
  ///
  /// If [shadowColor] is null, [ThemeData.shadowColor] is used.
  /// [shadowColor] represents the shadow which is visible on top of the navbar.
  ///
  /// If [backgroundColor] is null [BottomNavigationBarThemeData.backgroundColor]
  /// is used. If [BottomNavigationBarThemeData.backgroundColor] is null,
  /// [backgroundColor] defaults to [ThemeData.bottomAppBarColor].
  ///
  /// [shadow] is boolean value which corresponds whether to show the shadow or
  /// not.
  ///
  /// [currentIndex] is the start index of navigation bar.
  ///
  /// If custom [IconThemeData]s are used, you must provide both
  /// [selectedIconTheme] and [unselectedIconTheme], and both
  /// [IconThemeData.color] and [IconThemeData.size] must be set.
  ///
  /// If [showSelectedLabels] is `null`,
  /// [BottomNavigationBarThemeData.showSelectedLabels] is used.
  /// If [BottomNavigationBarThemeData.showSelectedLabels]  is null,
  /// then [showSelectedLabels] defaults to `true`.
  ///
  /// If [showUnselectedLabels] is `null`,
  /// [BottomNavigationBarThemeData.showUnselectedLabels] is used.
  /// If [BottomNavigationBarThemeData.showSelectedLabels] is null,
  /// then [showUnselectedLabels] defaults to `true`

  /// Defines the appearance of the button items that are arrayed within the
  /// bottom navigation bar.
  final List<BottomNavigationBarItem> items;

  /// Called when one of the [items] is tapped.
  ///
  /// The stateful widget that creates the bottom navigation bar needs to keep
  /// track of the index of the selected [BottomNavigationBarItem] and call
  /// `setState` to rebuild the bottom navigation bar with the new [currentIndex].
  final ValueChanged<int> onTap;

  /// The value of [activeColor].
  /// If `null` [BottomNavigationBarThemeData.selectedItemColor] is used.
  /// If [BottomNavigationBarThemeData.selectedItemColor] is null,
  /// then [ThemeData.indicatorColor] is used.
  final Color? activeColor;

  /// The value of [inactiveColor].
  /// If `null` [BottomNavigationBarThemeData.unselectedItemColor] is used.
  /// If [BottomNavigationBarThemeData.unselectedItemColor] is null,
  /// then [ThemeData.unselectedWidgetColor] is used.
  final Color? inactiveColor;

  /// The value of [indicatorColor].
  /// If `null` [BottomNavigationBarThemeData.selectedItemColor] is used.
  /// If [BottomNavigationBarThemeData.unselectedItemColor] is null,
  /// then [ThemeData.indicatorColor] is used.
  final Color? indicatorColor;

  /// The value of [shadowColor].
  /// If `null`, [ThemeData.shadowColor] is used.
  final Color? shadowColor;

  /// The value of [backgroundColor].
  /// If `null` [BottomNavigationBarThemeData.backgroundColor] is used.
  /// If [BottomNavigationBarThemeData.backgroundColor] is null,
  /// then [ThemeData.bottomAppBarColor] is used.
  final Color? backgroundColor;

  /// Boolean value whether to show or hide the shadow.
  final bool shadow;

  /// Starting index when the widget is rendered.
  final int currentIndex;

  /// The [TextStyle] of the [BottomNavigationBarItem] labels when they are
  /// selected.
  final TextStyle? selectedLabelStyle;

  /// The [TextStyle] of the [BottomNavigationBarItem] labels when they aren't
  /// selected.
  final TextStyle? unselectedLabelStyle;

  /// The size, opacity, and color of the icon in the currently unselected
  /// [BottomNavigationBarItem.icon]s.
  ///
  /// If this is not provided, the size will default to [iconSize], the color
  /// will default to [inactiveColor].
  ///
  final IconThemeData? unselectedIconTheme;

  /// The size, opacity, and color of the icon in the currently unselected
  /// [BottomNavigationBarItem.icon]s.
  ///
  /// If this is not provided, the size will default to [iconSize], the color
  /// will default to [activeColor].
  ///
  final IconThemeData? selectedIconTheme;

  /// Animation duration for indicator to move from one position to another.
  final int animationDuration;

  /// Whether the labels are shown for the unselected [BottomNavigationBarItem]s.
  final bool? showSelectedLabels;

  /// Whether the labels are shown for the selected [BottomNavigationBarItem].
  final bool? showUnselectedLabels;

  /// The z-coordinate of this [CustomBottomIndicatorBar].
  /// If `null` [BottomNavigationBarThemeData.elevation] is used.
  /// If [BottomNavigationBarThemeData.elevation] is null, defaults to `8.0`.
  final double? elevation;


  CustomBottomIndicatorBar({
    Key? key,
    required this.onTap,
    required this.items,
    this.activeColor,
    this.inactiveColor,
    this.indicatorColor,
    this.shadowColor,
    this.backgroundColor,
    this.shadow = false,
    this.currentIndex = 0,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.unselectedIconTheme,
    this.selectedIconTheme,
    this.animationDuration = 180,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.elevation,
  }) :  assert(items.length >= 2),
        assert(
        items.every((BottomNavigationBarItem item) => item.label != null),
        'Every item must have a non-null title or label',
        ),
        assert(elevation == null || elevation >= 0.0),
        assert(0 <= currentIndex && currentIndex < items.length),
        super(key: key);

  @override
  State createState() => _CustomBottomIndicatorBarState();
}

class _CustomBottomIndicatorBarState extends State<CustomBottomIndicatorBar> {
  List<BottomNavigationBarItem> get items => widget.items;

  double width = 0;
  late Color indicatorColor;
  late Color activeColor;
  late Color inactiveColor;
  late Color shadowColor;
  late Color backgroundColor;
  late double elevation;
  late int selectedIndex;
  late bool showSelectItemLabel;
  late bool showUnselectItemLabel;
  late double indicatorHeight = 2.0;
  double? _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr)
      return lerpDouble(-1.0, 1.0, index / (items.length - 1));
    else
      return lerpDouble(1.0, -1.0, index / (items.length - 1));
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomTheme = BottomNavigationBarTheme.of(context);
    final ThemeData themeData = Theme.of(context);
    width = MediaQuery.of(context).size.width;
    activeColor = widget.activeColor??
        bottomTheme.selectedItemColor?? themeData.indicatorColor;
    indicatorColor = widget.indicatorColor??
        bottomTheme.selectedItemColor?? themeData.indicatorColor;
    inactiveColor = widget.inactiveColor??
        bottomTheme.unselectedItemColor??
        themeData.unselectedWidgetColor;
    shadowColor = widget.shadowColor??
        themeData.shadowColor;
    backgroundColor = widget.backgroundColor??
        bottomTheme.backgroundColor?? themeData.bottomAppBarColor;
    final double additionalBottomPadding =
        MediaQuery.of(context).viewPadding.bottom;
    showSelectItemLabel = widget.showSelectedLabels??
        bottomTheme.showSelectedLabels ?? true;
    showUnselectItemLabel = widget.showUnselectedLabels??
        bottomTheme.showUnselectedLabels ?? true;
    elevation = widget.elevation?? bottomTheme.elevation ?? 8.0;
    return Semantics(
      explicitChildNodes: true,
      child: Material(
        color: widget.backgroundColor,
        elevation: elevation,
        child: Container(
          height: kBottomNavigationBarHeight + additionalBottomPadding,
          width: width,
          child: Stack(
            clipBehavior: Clip.none, children: <Widget>[
            Positioned(
              top: indicatorHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: items.asMap().map((index, item) =>
                    MapEntry(index, GestureDetector(
                      onTap: () => _selectItem(index, item),
                      child: _buildNavbarItem(item, index == selectedIndex),
                    ))).values.toList(),
              ),
            ),
            Positioned(
              top: 0,
              width: width,
              child: AnimatedAlign(
                alignment:
                Alignment(_getIndicatorPosition(selectedIndex)!, 0),
                curve: Curves.linear,
                duration: Duration(milliseconds: widget.animationDuration),
                child: Container(
                  color: indicatorColor,
                  width: width / items.length,
                  height: indicatorHeight,
                ),
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }

  _selectItem(int index, BottomNavigationBarItem item) {
    selectedIndex = index;
    // iconData = item.icon;
    widget.onTap(selectedIndex);
    setState(() {});
  }

  Widget _setIcon(BottomNavigationBarItem item, bool isSelected) {
    IconThemeData iconThemeData = isSelected ? widget.selectedIconTheme??
        IconThemeData(
          color: activeColor,
        ): widget.unselectedIconTheme??
        IconThemeData(
          color: inactiveColor,
        );
    return IconTheme(
      data: iconThemeData,
      child: item.icon,
    );
  }

  Text _setLabel(BottomNavigationBarItem item, bool isSelected){
    String label = isSelected?
    showSelectItemLabel? item.label?? "" : ""
        : showUnselectItemLabel? item.label?? "" : "";

    TextStyle style = isSelected ?
    widget.selectedLabelStyle ?? TextStyle(color: activeColor)
        : widget.unselectedLabelStyle ?? TextStyle(color: inactiveColor);

    return Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: style);
  }

  Widget _buildNavbarItem(
      BottomNavigationBarItem item, bool isSelected) {
    return Container(
      color: item.backgroundColor,
      height: kBottomNavigationBarHeight,
      width: width / items.length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _setIcon(item, isSelected),
          _setLabel(item, isSelected)
        ],
      ),
    );
  }
}