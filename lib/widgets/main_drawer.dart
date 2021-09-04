import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer(this.fnc);
  final fnc;

  buildListTile(title, context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      onTap: () => fnc(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Color(0xff2B2B2B),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 40),
                child: Text(
                  'Daily News',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              buildListTile('Top Headlines', context),
              buildListTile('Sports', context),
              buildListTile('Business', context),
              buildListTile('Science', context),
              buildListTile('Gaming', context),
            ],
          ),
        ),
      ),
    );
  }
}
