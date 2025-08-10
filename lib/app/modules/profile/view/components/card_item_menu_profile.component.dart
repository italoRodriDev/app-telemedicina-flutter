import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:flutter_svg/flutter_svg.dart'; // corrigido import

import '../../../../config/colors/colors.dart';

class CardItemMenuProfileComponent extends StatefulWidget {
  final String label;
  final String description;
  final Function onPressed;
  final bool showBtnUpdate;
  final Function? onPressedUpdate;

  const CardItemMenuProfileComponent(
      {super.key,
      required this.label,
      required this.description,
      required this.onPressed,
      required this.showBtnUpdate,
      this.onPressedUpdate});

  @override
  State<CardItemMenuProfileComponent> createState() =>
      _CardItemMenuProfileComponentState();
}

class _CardItemMenuProfileComponentState
    extends State<CardItemMenuProfileComponent> {
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextComponent(
                            value: widget.label,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary,
                            fontSize: 16,
                          ),
                          const SizedBox(width: 8),
                          widget.showBtnUpdate
                              ? InkWell(
                                  onTap: () {
                                    if (widget.onPressedUpdate != null) {
                                      widget.onPressedUpdate!();
                                    }
                                  },
                                  child: TextComponent(
                                      value: 'Atualizar',
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColor.primary,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: AppColor.primary))
                              : Container()
                        ],
                      ),
                      widget.description != ''
                          ? TextComponent(
                              value: widget.description,
                              color: AppColor.neutral1,
                              fontSize: 13,
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
