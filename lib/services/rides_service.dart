import 'package:blablacar/model/ride/locations.dart';

import '../data/dummy_data.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> allRides = fakeRides;

  List<Ride> filterByDeparture(Location departure) {
    List<Ride> filteredRide = [];
    allRides.map((e) {
      if (e.departureLocation == departure) {
        filteredRide.add(e);
      }
    });
    return filteredRide;
  }

  List<Ride> filterBySeatRequested(int seatRequested) {
    List<Ride> filteredRide = [];
    allRides.map((e) {
      if (e.remainingSeats >= seatRequested) {
        filteredRide.add(e);
      }
    });
    return filteredRide;
  }

  List<Ride> filterBy({Location? departure, int? seatRequested}) {
    List<Ride> filteredRide = [];
    allRides.map((e) {
      if (e.departureLocation == departure ||
          e.remainingSeats >= seatRequested!) {
        filteredRide.add(e);
      }
    });
    return filteredRide;
  }
}
