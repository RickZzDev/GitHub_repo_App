import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListViewShimmer extends StatelessWidget {
  const ListViewShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 5,
      ),
      itemCount: 100,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 4, top: 2),
          padding: EdgeInsets.symmetric(horizontal: 8),
          // color: Colors.grey,
          child: Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey[300],
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 80,
                ),
              ),
              Positioned(
                left: 0,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[100],
                  highlightColor: Colors.grey[300],
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(75),
                      ),
                    ),
                    width: 65,
                    height: 65,
                  ),
                ),
              ),
              Positioned(
                right: 16,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[100],
                  highlightColor: Colors.grey[300],
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(45),
                      ),
                    ),
                    width: 45,
                    height: 45,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
