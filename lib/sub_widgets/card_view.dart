import 'package:c2btech/constants/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CardView extends StatelessWidget {
  final String name;
  final String country;
  final String temperature;
  final String weatherIcon;
  final String weatherDescription;

  CardView(
      {this.name,
      this.country,
      this.temperature,
      this.weatherIcon,
      this.weatherDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.grey[400],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Image.network(
                        weatherIcon,
                        scale: 0.1,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Text(
                        '$temperature°',
                        style: kTempFieldStyle,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Text(
                  '$name , $country',
                  style: kTextFieldStyle,
                ),
              ),
              Expanded(
                child: Text(
                  '"$weatherDescription"',
                  style: kTextFieldStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
