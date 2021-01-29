import 'package:flutter/material.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/theme.dart';
import 'package:flutter_r1/widgets/buttons.dart';

class Alert extends StatelessWidget {
  final String title;
  String message;
  Widget body;
  final Function onAccept;
  final String acceptLabel;
  final String denyLabel;
  Function onDeny;

  Alert(
      {@required this.title,
      @required this.onAccept,
      this.message,
      this.body,
      this.acceptLabel = Texts.AcceptLabel,
      this.denyLabel = Texts.CloseLabel,
      this.onDeny}) {
    onDeny ??= () {};
    body ??= Container();
    message ??= "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              message != null ? Text(message) : null,
              body,
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                      label: denyLabel,
                      color: AppColors.light,
                      onPressed: () {
                        onDeny();
                        Navigator.of(context).pop();
                      }),
                  Button(
                      label: acceptLabel,
                      color: AppColors.positive,
                      onPressed: () {
                        onAccept();
                        Navigator.of(context).pop();
                      })
                ],
              ),
            ],
          ),
        ));
  }
}
