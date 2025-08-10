import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Modelo para cada item do menu
class TabItemData {
  final String icon;
  final String label;
  final Widget page;

  TabItemData({
    required this.icon,
    required this.label,
    required this.page,
  });
}

class TabsController extends StatefulWidget {
  final List<TabItemData> items;
  final Color backgroundColor;
  final Color selectedColor;
  final Color unselectedColor;

  const TabsController({
    super.key,
    required this.items,
    required this.selectedColor,
    required this.unselectedColor,
    this.backgroundColor = Colors.white,
  });

  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: widget.backgroundColor,
          body: widget.items[_selectedIndex].page,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: widget.selectedColor,
            unselectedItemColor: widget.unselectedColor,
            selectedLabelStyle: const TextStyle(fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            onTap: _onItemTapped,
            items: List.generate(widget.items.length, (index) {
              final item = widget.items[index];
              return BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/${item.icon}',
                  width: _selectedIndex == index ? 20 : 18,
                  color: _selectedIndex == index
                      ? widget.selectedColor
                      : widget.unselectedColor,
                ),
                label: item.label,
              );
            }),
          ),
        ),
      ),
    );
  }
}
