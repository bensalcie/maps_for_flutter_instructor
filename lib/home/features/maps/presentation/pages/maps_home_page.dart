import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_for_flutter/common/utils/constants.dart';

import '../../../../../common/utils/app_font.dart';
import '../widgets/single_destination_view.dart';

class MapsHomePage extends StatelessWidget {
  MapsHomePage({super.key});
  final Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              child: GoogleMap(
                key: const Key('maps-widget'),
                myLocationEnabled: false,
                mapToolbarEnabled: true,
                zoomControlsEnabled: true,
                tiltGesturesEnabled: true,
                zoomGesturesEnabled: true,
                buildingsEnabled: true,
                mapType: MapType.terrain,
                rotateGesturesEnabled: true,
                scrollGesturesEnabled: true,
                compassEnabled: false,
                indoorViewEnabled: true,
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                  Factory<OneSequenceGestureRecognizer>(
                    () => PanGestureRecognizer(),
                  ),
                }, // Allow scrolling all directions since listview already prevents targeting moves.
                onMapCreated: _onMapCreated,
                initialCameraPosition: const CameraPosition(
                  target: DEFAULTLOCATION, //Default to Nairobi
                  zoom: 12.0,
                  bearing: 192.8334901395799,
                  tilt: 59.0,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 38),
              child: Text(
                'Select location',
                style: TextStyle(fontFamily: AppFont.font),
              ),
            ),
            SingleDestinationView(
              isFirst: true,
              destinationName: 'Point of Departure',
              index: 0,
            ),
            ListView.builder(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  // We remove the first since its already taken up by the

                  return SingleDestinationView(
                    index: index,
                    destinationName: 'Nairobi',
                  );
                },
                itemCount: 2),

            /// This is the Last button to request user to add destination.
            ///
            SingleDestinationView(
              isFirst: false,
              index: null,
              destinationName: 'Destination',
            ),
          ],
        ),
      ),
    );
  }
}
