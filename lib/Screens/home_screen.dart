import 'package:flutter/material.dart';
import 'package:mandaditos_express/services/services.dart';
import 'package:mandaditos_express/utils/main_menu.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  final List<String> _options = ["Usuario", "Mandado", "Chat", "FeedBack"];
  @override
  Widget build(BuildContext context) {
    //final mainProvider = Provider.of<MainProvider>(context, listen: true);
    //final mainProvider = Provider.of<MainProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          title: Text(
            _options[_selectedIndex],
            style: const TextStyle(color: Colors.white),
          ),
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: const SizedBox.square(
            dimension: 40.0,
            // child: Switch(
            //     activeColor: Theme.of(context).primaryColorLight,
            //     value: mainProvider.mode,
            //     onChanged: (bool value) async {
            //       mainProvider.mode = value;
            //       final prefs = await SharedPreferences.getInstance();
            //       await prefs.setBool("mode", value);
            //     }
            //     )
          ),
        ),
        body: content_widget[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.deepOrange,
          onTap: (int index) {
            _selectedIndex = index;
            Colors.white;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: menuOptions
              .map((e) => BottomNavigationBarItem(
                  icon: Icon(
                    e.icon,
                    color: Colors.white,
                  ),
                  label: e.label,
                  backgroundColor: Colors.deepOrange))
              .toList(),
          currentIndex: _selectedIndex,
        ));
  }
}
