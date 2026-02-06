import 'package:blablacar/model/ride/locations.dart';
import 'package:blablacar/model/ride/ride.dart';
import 'package:blablacar/services/rides_service.dart';

void main() {
  Location dijon = Location(country: Country.france, name: "Dijon");

  List<Ride> filteredRide = RidesService.filterBy(departure: Location(name: "Dijon", country: Country.france), seatRequested: 2);

  for (Ride ride in filteredRide) {
    print(ride);
  }
}
