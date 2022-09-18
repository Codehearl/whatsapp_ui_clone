import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/colors.dart';
import 'package:whatsapp_ui_clone/components/alert.dart';
import 'package:whatsapp_ui_clone/components/popup_menu.dart';
import 'package:whatsapp_ui_clone/screens/calls_page.dart';
import 'package:whatsapp_ui_clone/screens/contacts_list.dart';
import 'package:whatsapp_ui_clone/screens/status_page.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

class _MobileLayoutState extends State<MobileLayout> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Whatsapp",
            style: TextStyle(color: Colors.grey),
          ),
          backgroundColor: appBarColor,
          actions: [
            IconButton(
                onPressed: () => alertDialog(context),
                icon: const Icon(Icons.search)),
            const PopupMenu(),
          ],
          bottom: TabBar(
            controller: _tabController,
              onTap: ((value) {
                alertDialog(context);
              }),
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              labelColor: tabColor,
              indicatorColor: tabColor,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Tab(
                  text: ("CHATS"),
                ),
                Tab(
                  text: ("STATUS"),
                ),
                Tab(
                  text: ("CALLS"),
                ),
              ]),
          elevation: 0,
        ),
        body: Navigator(
          
          key: _navKey,
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (_) =>  TabBarView(
              controller:_tabController,
              children: const [
                ContactList(),
                StatusPage(),
                CallsPage(),
              ],
            ),
          ),
        ));
  }
}
