import 'package:flutter/material.dart';

class Styles {
  TextFormFieldWidget( LineName) {
    return TextField(
      decoration: InputDecoration(
          labelText: LineName,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.email_outlined),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Colors.grey,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
          ),
          border: OutlineInputBorder()),
    );
  }
  TextFormFieldWidgetForData(String LineName) {
    return TextField(
      decoration: InputDecoration(
          labelText: LineName,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.calendar_month),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Colors.grey,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          border: OutlineInputBorder()),
    );
  }
  TextFormFieldWidgetForNumber(LineName) {
    return TextField(
      keyboardType:TextInputType.phone ,
      decoration: InputDecoration(
          labelText: LineName,
          prefixText: "+7",
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.phone),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Colors.grey,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
          ),
          border: OutlineInputBorder()),
    );
  }
  TextFormFieldWidgetForEmailConst(text) {
    return TextField(
      enabled:false,
      keyboardType:TextInputType.phone ,
      decoration: InputDecoration(
          labelText:text,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.email_outlined),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Colors.grey,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          border: OutlineInputBorder()),
    );
  }
}