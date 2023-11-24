class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LoactionCoordinates coordinates;
  final LocationTimezone timezone;

  UserLocation({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });
  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final timezone = LocationTimezone.fromMap(json['timezone']);
    final street = LocationStreet.fromMap(json['street']);
    final coordinate = LoactionCoordinates.fromMap(json['coordinate']);
    return UserLocation(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(),
      coordinates: coordinate,
      street: street,
      timezone: timezone,
    );
  }
}

class LoactionCoordinates {
  final String latitude;
  final String longitude;

  LoactionCoordinates({
    required this.latitude,
    required this.longitude,
  });
  factory LoactionCoordinates.fromMap(Map<String, dynamic> json) {
    return LoactionCoordinates(
        latitude: json['latitude'], longitude: json['longitude']);
  }
}

class LocationTimezone {
  final String offset;
  final String description;

  LocationTimezone({
    required this.offset,
    required this.description,
  });
  factory LocationTimezone.fromMap(Map<String, dynamic> json) {
    return LocationTimezone(
        offset: json['offset'], description: json['description']);
  }
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({required this.number, required this.name});
  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(number: json['number'], name: json['name']);
  }
}
