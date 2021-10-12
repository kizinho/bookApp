
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFormField(
            style: Theme.of(context).textTheme.overline,
            key: key,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: 'Search keywords...',
              alignLabelWithHint: true,
              focusColor: Theme.of(context).disabledColor,
              fillColor: Theme.of(context).shadowColor,
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).disabledColor,
                size: 18,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide:
                BorderSide(color: Theme.of(context).shadowColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide:
                BorderSide(color: Theme.of(context).shadowColor, width: 1.0),
              ),
              labelStyle: Theme.of(context).textTheme.overline,
            ),

            textInputAction: TextInputAction.search,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            alignment: Alignment.center,
            height: 38,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).primaryColor
            ),
            child: FaIcon(FontAwesomeIcons.slidersH,
                size: 23, color: Theme.of(context).canvasColor),
          ),
        )
      ],
    );
  }
}
