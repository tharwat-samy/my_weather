import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/functions/check_selected.dart';
import '../utils/size_config.dart';
import 'custom_tap.dart';

class CustomTapView extends StatefulWidget {
  const CustomTapView(
      {super.key,
      required this.children,
      required this.labels,
      required this.padding,
      this.flexIndex});

  @override
  _CustomTapViewState createState() => _CustomTapViewState();
  final List<Widget> children;

  final List<String> labels;

  final EdgeInsets padding;

  // carry the index of the tap and the flex value it should have
  final FlexIndex? flexIndex;
}

class _CustomTapViewState extends State<CustomTapView>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  var _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    _pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: widget.padding,
          child: Container(
            height: SizeConfig.defaultSize * 4,
            child: Row(
              children: widget.labels.asMap().entries.map<Widget>((entry) {
                return Expanded(
                  flex: widget.flexIndex?.flexValue[entry.key] ?? 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: CustomTap(
                      onTap: () {
                        changeIndex(entry.key);
                      },
                      isSelected:
                          checkIfSelected(entry.key, getPageControllerIndex()),
                      text: widget.labels[entry.key],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            children: widget.children,
          ),
        ),
      ],
    );
  }

  void changeIndex(int index) {
    _pageController.jumpToPage(index);
    setState(() {});
  }

  int getPageControllerIndex() {
    return _pageController.hasClients ? _pageController.page!.round() : 0;
  }
}

class FlexIndex {
  final List<int> flexValue;

  FlexIndex({required this.flexValue});
}
