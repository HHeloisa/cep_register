import 'package:cep_register/constants/breakpoints.dart';
import 'package:flutter/material.dart';

import 'label_h1.dart';

class NavigationButton extends StatefulWidget {
  const NavigationButton({super.key, this.funcao, required this.texto});

  final Function? funcao;
  final String texto;
  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  String resultado = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Breakpoints.b16),
      child: ElevatedButton(
          onPressed: (() => widget.funcao == null ? null : widget.funcao!()),
          child: Padding(
            padding: const EdgeInsets.all(Breakpoints.b8),
            child: LabelH1(
              label: widget.texto,
              color: Colors.white,
            ),
          )),
    );
  }
}
