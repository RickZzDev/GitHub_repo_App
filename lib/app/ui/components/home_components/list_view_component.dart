import 'package:ambar_test/app/controllers/home_controller/home_controller.dart';
import 'package:ambar_test/app/utils/styles_utils/styles_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewRepo extends StatelessWidget {
  const ListViewRepo({
    Key key,
    @required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 5,
      ),
      itemCount: _controller.repos.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 4, top: 2),
          padding: EdgeInsets.symmetric(horizontal: 8),
          // color: Colors.grey,
          child: Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(1, 2.0), //(x,y)
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Coder: ",
                          style: textStyle.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${_controller.repos[index].owner.login}",
                          style: textStyle.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Repo: ",
                          style: textStyle.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${_controller.repos[index].name}",
                          style: textStyle.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                child: Container(
                  width: 65,
                  height: 65,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(65),
                    ),
                    child: Image.network(
                      _controller.repos[index].owner.avatarUrl,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.grey[400],
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(75),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.5),
                    //     offset: Offset(1, 2.0), //(x,y)
                    //     blurRadius: 2.0,
                    //   ),
                    // ],
                  ),
                ),
              ),
              Positioned(
                right: 16,
                child: InkWell(
                  onTap: () =>
                      _controller.goRepoPage(_controller.repos[index].htmlUrl),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(45),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(1, 2.0), //(x,y)
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    width: 45,
                    height: 45,
                    child: Center(
                      child: Icon(Icons.arrow_forward_ios,
                          color: Theme.of(context).primaryColor),
                    ),
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
