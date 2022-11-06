import 'package:advella/models/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServicesCard extends StatefulWidget {

  var services = <Service>[];

  ServicesCard(this.services);

  @override
  _ServicesCardState createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: widget.services.length,
      scrollDirection: Axis.vertical,
      separatorBuilder: (BuildContext context, int index) => Divider(thickness: 10,),
      itemBuilder: (context, index) {
        if(widget.services.length == 0) {
          return Container(
            child: Center(
              child: Text('No posts exist'),
            ),
          );
        }
        else {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/taskDetail');
            },
            child: SizedBox(

              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                      'assets/icons/repair.png',
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${widget.services[index].category} · ${widget.services[index].timeSincePosted}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600]
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 10,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        widget.services[index].location,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          new Spacer(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Column(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/icons/money.svg',
                                  height: 13,
                                  width: 13,
                                  color: Colors.grey[700],
                                ),
                                SvgPicture.asset(
                                  'assets/icons/calendar.svg',
                                  height: 13,
                                  width: 13,
                                  color: Colors.grey[800],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                widget.services[index].price,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[800],
                                ),
                              ),
                              Text(
                                widget.services[index].dueDate,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        widget.services[index].title,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        widget.services[index].description,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Image.asset(
                      widget.services[index].image,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '${widget.services[index].numberOfBids} bids',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(thickness: 1,),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 2, 30, 10),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                            child: Icon(
                              Icons.thumb_up_alt_outlined,
                              size: 18,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            'Like',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                          new Spacer(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                            child: Icon(
                              Icons.mode_comment_outlined,
                              size: 18,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            'Comment',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                          new Spacer(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                            child: Icon(
                              Icons.share_outlined,
                              size: 18,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            'Share',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
