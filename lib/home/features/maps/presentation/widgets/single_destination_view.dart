import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timelines/timelines.dart';

import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'dart:io' show Platform;

import '../../../../../common/utils/app_font.dart';
import '../../../../../common/utils/constants.dart';

///[SingleDestinationView]
///
///View to represent every single location.
///Displays on the Add orders page
///[isFirst] checks if the widget is shown first whe default location is not selected.
///

class SingleDestinationView extends StatefulWidget {
  bool? isFirst;
  int? index;

  String destinationName;
  SingleDestinationView({
    super.key,
    this.isFirst,
    this.index,
    required this.destinationName,
  });

  @override
  State<SingleDestinationView> createState() => _SingleDestinationViewState();
}

class _SingleDestinationViewState extends State<SingleDestinationView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 8,
                ),
                widget.isFirst != null && widget.isFirst == true
                    ? const OutlinedDotIndicator(
                        color: Colors.green,
                        borderWidth: 4,
                      )
                    : Icon(
                        widget.isFirst == false
                            ? Icons.add_circle_outline
                            : Icons.location_on_rounded,
                        color: const Color.fromRGBO(130, 130, 130, 1),
                      ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    height: 20.0,
                    child: widget.isFirst == false
                        ? const SizedBox.shrink()
                        : const SolidLineConnector(
                            color: Color.fromRGBO(130, 130, 130, 1),
                            thickness: 1,
                          ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: InkWell(
                        onTap: () {
                          //TODO ADD PLACE PICKER
                        },
                        child: Text(
                          widget.isFirst == false
                              ? 'Add drop-off Point'
                              : widget.destinationName,
                          style: const TextStyle(
                              fontSize: 14, fontFamily: AppFont.font),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: widget.isFirst == true || widget.isFirst == null
                            ? GestureDetector(
                                onTap: () {
                                  //TODO ADD EVENT TO DRIGGER DELETE.
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 17,
                                  color: Color.fromRGBO(130, 130, 130, 1),
                                ),
                              )
                            : const SizedBox.shrink()),
                  ],
                ),
                widget.isFirst == true || widget.isFirst == null
                    ? const Divider(
                        thickness: 1,
                        height: 27,
                        endIndent: 0,
                        color: Color.fromRGBO(189, 189, 189, 1),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
