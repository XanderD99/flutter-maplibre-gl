part of '../maplibre_gl_platform_interface.dart';

abstract class Annotation<T extends AnnotationOptions> {
  void translate(LatLng delta);

  Annotation(String id, this.options, [Map? data])
      : _id = id,
        _data = data ?? {};

  /// A unique identifier for this circle.
  ///
  /// The identifier is an arbitrary unique string.
  final String _id;
  String get id => _id;

  final Map _data;
  Map get data => _data;

  /// The circle configuration options most recently applied programmatically
  /// via the map controller.
  ///
  /// The returned value does not reflect any changes made to the circle through
  /// touch events. Add listeners to the owning map controller to track those.
  T options;

  Map<String, dynamic> toGeoJson() {
    final geojson = options.toGeoJson();
    geojson["id"] = id;
    geojson["properties"] = {
      'id': id,
      ...geojson["properties"],
      ...data,
    };

    return geojson;
  }
}

abstract class AnnotationOptions {
  Map<String, dynamic> toGeoJson();
}
