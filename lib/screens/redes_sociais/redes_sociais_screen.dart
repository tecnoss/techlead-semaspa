import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/utils/app_colors.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class RedesSociaisScreen extends StatelessWidget {
  const RedesSociaisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(),
        leading: const Leading(),
      ),
      bottomNavigationBar: const BottomBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ScreenTitle(title: "Redes Sociais da SEMAS"),
            const Text(
              'Acompanhe nossas redes sociais e fique por dentro de '
              'tudo que acontece na SEMAS.',
              style: TextStyle(fontSize: 12.0),
            ),
            16.height,
            const Text(
              'Curta! Siga! Compartilhe!',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: appColorPrimary,
              ),
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/redes_sociais/facebook.svg',
                  ),
                  iconSize: 48,
                  color: appColorPrimary,
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/redes_sociais/twitter.svg',
                  ),
                  iconSize: 48,
                  color: appColorPrimary,
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/redes_sociais/instagram.svg',
                  ),
                  iconSize: 48,
                  color: appColorPrimary,
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/redes_sociais/youtube.svg',
                  ),
                  iconSize: 48,
                  color: appColorPrimary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}