import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:flutter_svg/flutter_svg.dart'; // corrigido import

import '../../../../config/colors/colors.dart';

class CardItemMenuComponent extends StatefulWidget {
  final String icon;
  final String label;
  final String description;
  final Function onPressed;

  const CardItemMenuComponent({
    super.key,
    required this.label,
    required this.description,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<CardItemMenuComponent> createState() => _CardItemMenuComponentState();
}

class _CardItemMenuComponentState extends State<CardItemMenuComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => widget.onPressed(),
      child: Card(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColor.medium))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/${widget.icon}',
                    width: 22,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextComponent(
                        value: widget.label,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary,
                        fontSize: 16,
                      ),
                      widget.description != ''
                          ? TextComponent(
                              value: widget.description,
                              fontSize: 13,
                              color: AppColor.neutral1,
                            )
                          : Container()
                    ],
                  )
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColor.medium,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
