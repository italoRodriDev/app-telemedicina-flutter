import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telemedicina/app/config/colors/colors.dart';

class AnimatedCardsList extends StatefulWidget {
  const AnimatedCardsList({super.key});

  @override
  State<AnimatedCardsList> createState() => _AnimatedCardsListState();
}

class _AnimatedCardsListState extends State<AnimatedCardsList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final int cardCount = 5;
  final double cardHeight = 60;
  final double spacing = 16;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // iniciar animação
    Future.delayed(const Duration(milliseconds: 300), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget card({
    required String icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.neutral2,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 8),
                    SvgPicture.asset('assets/images/$icon', width: 22),
                    const SizedBox(width: 20),
                    TextComponent(
                      value: label,
                      fontWeight: FontWeight.w600,
                      color: AppColor.neutral1, // AppColor.neutral1
                      fontSize: 16,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.arrow_forward_ios,
                      color: AppColor.neutral1, size: 16),
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (cardHeight + spacing) * cardCount,
      child: Stack(
        children: List.generate(cardCount, (index) {
          final startTop = 0.0;
          final endTop = index * (cardHeight + spacing);

          final startInterval = index * 0.1;
          final endInterval = startInterval + 0.5;

          final animation = Tween<double>(
            begin: startTop,
            end: endTop,
          ).animate(
            CurvedAnimation(
              parent: _controller,
              curve:
                  Interval(startInterval, endInterval, curve: Curves.easeOut),
            ),
          );

          final opacity = Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: _controller,
              curve:
                  Interval(startInterval, endInterval, curve: Curves.easeOut),
            ),
          );

          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                top: animation.value,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: opacity.value,
                  child: card(
                    icon: [
                      'comprometimento.svg',
                      'premios.svg',
                      'desafio_mensal.svg',
                      'ranking.svg',
                      'inovacao_e_voce.svg'
                    ][index],
                    label: [
                      'Comprometimento',
                      'Prêmios',
                      'Desafio mensal',
                      'Ranking',
                      'Inovação & Você'
                    ][index],
                    onPressed: () {
                      print('Card ${index + 1} clicado');
                    },
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
