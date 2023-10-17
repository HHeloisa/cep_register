import 'package:cep_register/constants/string.dart';
import 'package:flutter/material.dart';

class CustonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustonAppBar({this.title, this.actions, this.leading, super.key});

  final String? title;
  final List<Widget>? actions;
  final Widget? leading;

  final double height = 60.0;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      centerTitle: true,
      actions: actions ??
          [
            IconButton(
                iconSize: 30,
                onPressed: () => Navigator.pushNamed(context, '/about'),
                icon: const Icon(Icons.info_outline_rounded))
          ],
      leading: leading ??
          Builder(
            builder: (BuildContext context) {
              return Navigator.canPop(context)
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back, size: 24),
                      onPressed: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                      tooltip: voltar,
                    )
                  : Container();
            },
          ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
