import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.icon,
  });

  static const home = MenuItem(title: 'home', icon: Icons.home_rounded);
  static const aiCamera =
      MenuItem(title: 'aiCamera', icon: Icons.camera_alt_rounded);
  static const chatgpt = MenuItem(title: 'chatgpt', icon: Icons.chat_rounded);
  static const help = MenuItem(title: 'help', icon: Icons.help_rounded);
  static const aboutUs = MenuItem(title: 'aboutUs', icon: Icons.info_rounded);
  static const rateUs = MenuItem(title: 'rateUs', icon: Icons.star_rounded);

  static const all = [
    home,
    aiCamera,
    chatgpt,
    help,
    aboutUs,
    rateUs,
  ];

  static String getLocalizedString(BuildContext context, String key) {
    final localizations = AppLocalizations.of(context);
    if (localizations == null) {
      throw Exception('Localization context is null');
    }

    final localizationMap = {
      'home': localizations.home,
      'aiCamera': localizations.ai_camera,
      'chatgpt': localizations.chat_gpt,
      'help': localizations.help,
      'aboutUs': localizations.about_us,
      'rateUs': localizations.rate_us,
    };

    return localizationMap[key] ?? 'Key not found: $key';
  }
}

class MenuTile extends StatelessWidget {
  const MenuTile({
    super.key,
    required this.onTap,
    required this.isActive,
    required this.menuItem,
  });
  final MenuItem menuItem;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              height: 56,
              width: isActive ? 288 : 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6792FF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ListTile(
              leading: SizedBox(
                height: 34,
                width: 34,
                child: Icon(
                  menuItem.icon,
                  color: Colors.white70,
                ),
              ),
              title: Text(
                MenuItem.getLocalizedString(context, menuItem.title),
                style: const TextStyle(color: Colors.white70),
              ),
              onTap: onTap,
            ),
          ],
        ),
      ],
    );
  }
}
