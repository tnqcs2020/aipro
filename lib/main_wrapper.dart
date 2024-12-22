import 'package:aipro/controller/language_controller.dart';
import 'package:aipro/widgets/menu_item.dart';
import 'package:aipro/widgets/info_card.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 0;
  void _goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("AI PRO"),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: widget.navigationShell,
          ),
        ],
      ),
      endDrawer: Container(
        width: 288,
        height: double.infinity,
        // color: const Color(0xFF17203A),
        color: Colors.indigo,
        child: SafeArea(
          child: Column(
            children: [
              InfoCard(
                name: AppLocalizations.of(context)!.boss,
                profession: "IT",
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              ...MenuItem.all.map(
                (menuItem) => MenuTile(
                  menuItem: menuItem,
                  onTap: () {
                    setState(() {
                      selectedIndex = MenuItem.all.indexOf(menuItem);
                    });
                    _goToBranch(selectedIndex);
                    // Navigator.of(context).pop();
                  },
                  isActive: selectedIndex == MenuItem.all.indexOf(menuItem),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: DefaultTextStyle.merge(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    width: 85,
                    child: AnimatedToggleSwitch<bool>.dual(
                      current: provider.appLocale?.languageCode == 'en',
                      first: false,
                      second: true,
                      spacing: 0,
                      animationDuration: const Duration(milliseconds: 600),
                      style: const ToggleStyle(
                        borderColor: Colors.transparent,
                        indicatorColor: Colors.transparent,
                        backgroundColor: Colors.white,
                      ),
                      onChanged: (bool value) {
                        provider.changeLanguage(Locale(value ? 'en' : 'vi'));
                      },
                      borderWidth: 3,
                      height: 45,
                      iconBuilder: (value) =>
                          provider.appLocale?.languageCode == 'en'
                              ? Image.asset(
                                  "assets/images/uk-flag.png",
                                )
                              : Image.asset(
                                  "assets/images/vietnam-flag.png",
                                ),
                      textBuilder: (value) =>
                          provider.appLocale?.languageCode == 'en'
                              ? const Center(child: Text('VI'))
                              : const Center(child: Text('EN')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
