import 'package:cep_register/constants/breakpoints.dart';
import 'package:cep_register/widgets/custon_app_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustonScaffold extends StatelessWidget {
  CustonScaffold(
      {Key? key,
      this.body,
      this.appBar,
      this.appBarTitle,
      this.backgroundColor,
      this.bottomNavigationBar,
      this.floatingActionButtonLocation,
      this.floatingActionButton,
      this.extendBodyBehindAppBar = false,
      this.showDrawer,
      this.removePadding})
      : super(key: key);

  final Widget? body;
  final PreferredSizeWidget? appBar;
  String? appBarTitle;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool extendBodyBehindAppBar;
  final bool? showDrawer;
  final bool? removePadding;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        /// Sempre que o usuario clicar no fundo da tela, ele remove o foque dos outros widgets.
        onTap: () => FocusScope.of(context).unfocus(),
        // child: MediaQuery(
        /// Vai fixar a visualização textual do jeito que está criada, desconsiderando as configurações de acessibilidade do usuário
        // data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          bottomNavigationBar: bottomNavigationBar,
          appBar: (appBar ??
              CustonAppBar(
                title: appBarTitle,
              )),
          body: removePadding == true
              ? body
              : Padding(
                  padding: const EdgeInsets.all(Breakpoints.b16),
                  child: body,
                ),
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: true,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButton: floatingActionButton,
          extendBodyBehindAppBar: false,
        ),
      ),
      // ),
    );
  }
}
