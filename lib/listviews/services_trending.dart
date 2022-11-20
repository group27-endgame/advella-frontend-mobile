import 'package:advella/models/service.dart';
import 'package:flutter/material.dart';

class ServicesTrending extends StatefulWidget {

  var trendingServices = <OldService>[];

  ServicesTrending(this.trendingServices);

  @override
  _ServicesTrendingState createState() => _ServicesTrendingState();
}

class _ServicesTrendingState extends State<ServicesTrending> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.trendingServices.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        if(widget.trendingServices.length == 0) {
          return Container(
            child: Center(
              child: Text('No trending services'),
            ),
          );
        }
        else {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/taskDetail');
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 15, 20),
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      widget.trendingServices[index].image,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.trendingServices[index].title + '\n' +
                      widget.trendingServices[index].price + '\n' +
                      widget.trendingServices[index].location,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(20),
              //   child: Image.asset(widget.trendingServices[index].image),
              // ),
            ),
          );
        }
      },
    );
  }
}
