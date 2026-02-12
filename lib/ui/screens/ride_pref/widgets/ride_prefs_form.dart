import 'package:blablacar/ui/widgets/actions/bla_button.dart';
import 'package:blablacar/ui/widgets/actions/bla_switch_button.dart';
import 'package:blablacar/ui/widgets/display/bla_divider.dart';
import 'package:blablacar/ui/widgets/inputs/bla_date_tile.dart';
import 'package:blablacar/ui/widgets/inputs/bla_location_tile.dart';
import 'package:blablacar/ui/widgets/inputs/bla_passenger_tile.dart';
import 'package:flutter/material.dart';

import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    if (widget.initRidePref != null) {
      departure = widget.initRidePref!.departure;
      departureDate = widget.initRidePref!.departureDate;
      arrival = widget.initRidePref!.arrival;
      requestedSeats = widget.initRidePref!.requestedSeats;
    } else {
      departureDate = DateTime.now();
      requestedSeats = 1;
    }
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  void onSwitch() {
    Location? temp = arrival;
    setState(() {
      arrival = departure;
      departure = temp;
    });
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ---------------------------------- 

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlaLocationTile(
          location: departure,
          type: LocationType.departure,
          onPressed: () {},
          trailingIcon: BlaSwitchButton(onPressed: onSwitch),
        ),
        BlaDivider(),
        BlaLocationTile(
          location: arrival,
          type: LocationType.arrival,
          onPressed: onSwitch,
        ),
        BlaDivider(),
        BlaDateTile(date: departureDate, onPressed: () {}),
        BlaDivider(),
        BlaPassengerTile(numberOfPassenger: requestedSeats, onPressed: () {}),
        BlaButton(onPressed: () {}, text: "Search"),
      ],
    );
  }
}
