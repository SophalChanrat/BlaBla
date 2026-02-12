import 'package:blablacar/model/ride/locations.dart';
import 'package:blablacar/services/location_service.dart';
import 'package:blablacar/ui/widgets/actions/location_search_bar.dart';
import 'package:blablacar/ui/widgets/display/location_result_tile.dart';
import 'package:flutter/material.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  final TextEditingController controller = TextEditingController();
  List<Location> filteredLocation = [];

  @override
  void initState() {
    super.initState();
    filteredLocation = LocationsService.availableLocations;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onSearch(String value) {
    setState(() {
      filteredLocation = LocationsService.availableLocations.where((location) {
        return location.name.toLowerCase().contains(value.toLowerCase());
      }).toList();
    });
  }

  void onClear() {
    controller.clear();
    setState(() {
      filteredLocation = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LocationSearchBar(
            controller: controller,
            onChanged: onSearch,
            onCleared: onClear,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
              final location = filteredLocation[index];
              return LocationResultTile(
                onPressed: () {
                  Navigator.pop(context, location);
                },
                location: location,
              );
              },
              itemCount: filteredLocation.length,
            ),
          ),
        ],
      ),
    );
  }
}
