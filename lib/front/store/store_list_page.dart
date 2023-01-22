import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store_app/front/detail/detail_page.dart';
import 'package:store_app/front/widget/button_logout_widget.dart';
import 'package:store_app/front/widget/list_tile_store.dart';
import 'package:store_app/model/response_login.dart';
import 'package:store_app/repository/auth_repository.dart';

class StoreListPage extends StatefulWidget {
  const StoreListPage({super.key});

  @override
  State<StoreListPage> createState() => _StoreListPageState();
}

class _StoreListPageState extends State<StoreListPage> {
  Future<ResponseLogin>? futureResp;
  @override
  void initState() {
    futureResp = AuthRepository().loginAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder<ResponseLogin>(
        future: futureResp,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var stores = snapshot.data!.stores;
            var lat = double.parse(stores[1].latitude);
            var long = double.parse(stores[1].longitude);
            LatLng sourceLocation = LatLng(lat, long);
            return SafeArea(
                child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'List Store',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('User A')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child:
                            InkWell(onTap: () {}, child: ButtonLogoutWidget()),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    color: Colors.black38,
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: GoogleMap(
                        initialCameraPosition:
                            CameraPosition(target: sourceLocation, zoom: 14.5)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(stores.length, (index) {
                      var address = stores[index].address;
                      var store_name = stores[index].storeName;
                      var dc_name = stores[index].dcName;
                      var channel_name = stores[index].channelName;
                      var area_name = stores[index].areaName;
                      var subchannel_name = stores[index].subchannelName;
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      sub_tipe_display: subchannel_name,
                                      store_name: store_name,
                                      address: address,
                                      tipe_outlet: subchannel_name,
                                      tipe_display: dc_name)));
                            },
                            child: ListTileStore(
                                name: store_name, deskripsi: dc_name)),
                      );
                    }),
                  )
                ],
              ),
            ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
