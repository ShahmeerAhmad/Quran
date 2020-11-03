import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  String title;
  ShimmerLoading({this.title});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Shimmer.fromColors(
          enabled: true,
          baseColor: Colors.transparent,
          highlightColor: Color(0xFFB48F32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  'image/2.png',
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                "Loading $title",
                style: TextStyle(
                    color: Color(0xFFB49A68),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          direction: ShimmerDirection.ltr,
          period: Duration(seconds: 2),
        ),
      ),
    );
  }
}
