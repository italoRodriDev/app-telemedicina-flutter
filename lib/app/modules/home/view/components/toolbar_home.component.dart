import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telemedicina/app/config/colors/colors.dart';

class ToolbarHomeComponent extends StatefulWidget {
  Function onPressedMenu;
  Function onPressedCheckIn;
  ToolbarHomeComponent(
      {super.key, required this.onPressedMenu, required this.onPressedCheckIn});

  @override
  State<ToolbarHomeComponent> createState() => _ToolbarHomeComponentState();
}

class _ToolbarHomeComponentState extends State<ToolbarHomeComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _cardHeight;
  late Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _cardHeight = Tween<double>(begin: 200, end: 230).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.9), // começa mais para baixo
      end: Offset.zero, // posição normal
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // inicia animação com um pequeno atraso
    Future.delayed(const Duration(milliseconds: 300), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int coins = 50;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Stack(
          children: [
            Container(height: 320), // altura total da área

            // Card verde animado
            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              height: _cardHeight.value,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  // Row do nome
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text("Olá, ",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                          Text("Nome Sobrenome",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/coracao.svg',
                                width: 30,
                                height: 30,
                                color: Colors.white,
                              ),
                              Text(
                                coins.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: () {
                              widget.onPressedMenu();
                            },
                            icon: SvgPicture.asset(
                              'assets/images/menu.svg',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Texto animado
                  SlideTransition(
                    position: _textSlide,
                    child: const Column(
                      children: [
                        Text(
                          'Você bem,',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'a gente também',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Card de check-in
            Positioned(
                top: 170,
                right: 30,
                left: 30,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                      onTap: () {
                        widget.onPressedCheckIn();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                              ),
                              child: SvgPicture.asset(
                                'assets/images/background_card_checkin_home.svg',
                              ),
                            ),
                            Positioned(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextComponent(
                                      value: 'Check-in da saúde',
                                      color: AppColor.tertiary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/checkin_ativo.svg',
                                            width: 14),
                                        const SizedBox(width: 2),
                                        TextComponent(
                                            value: 'Entrada',
                                            fontSize: 14,
                                            color: AppColor.tertiary),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/checkin_inativo.svg',
                                            width: 14),
                                        const SizedBox(width: 2),
                                        TextComponent(
                                            value: 'Saída',
                                            fontSize: 14,
                                            color: AppColor.neutral1),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                ])),
          ],
        );
      },
    );
  }
}
