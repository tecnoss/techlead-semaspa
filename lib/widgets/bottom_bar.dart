import 'package:flutter/material.dart';
import 'package:semasma/utils/app_colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(top: 2),
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: appColorPrimary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 100,
            child: Text(
              "SECRETARIA DE MEIO AMBIENTE E SUSTENTABILIDADE",
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.white,
                fontSize: 6,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image.asset(
            'assets/images/logo-pa.png',
            height: 80,
            width: 80,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "GOVERNO",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "DO ESTADO",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "DO PARÁ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 100,
              )
            ],
          )
        ],
      ),
    );
  }
}
