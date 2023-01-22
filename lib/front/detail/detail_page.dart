import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:store_app/front/widget/button_visit_widget.dart';

class DetailPage extends StatefulWidget {
  final String store_name;
  final String address;
  final String tipe_outlet;
  final String tipe_display;
  final String sub_tipe_display;
  const DetailPage(
      {super.key,
      required this.store_name,
      required this.address,
      required this.tipe_outlet,
      required this.tipe_display,
      required this.sub_tipe_display});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset(
              'assets/stores.jpg',
              width: MediaQuery.of(context).size.width,
              height: 380,
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_pin),
                              // SizedBox(
                              //   width: 10,
                              // ),
                              Text('Lokasi Belum Sesuai'),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {}, child: Text('Reset'))
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Icon(
                                  Icons.store,
                                  size: 30,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.store_name,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(widget.address),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                            'Tipe Outlet                 : ${widget.tipe_outlet}'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                            'Tipe Display               : ${widget.tipe_display}'),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                            'Tipe Sub Display       : ${widget.sub_tipe_display}'),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonVisitWidget(
                        color: Colors.redAccent,
                        name: 'No Visit',
                      ),
                      ButtonVisitWidget(
                        color: Colors.blueAccent,
                        name: 'Visit',
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
