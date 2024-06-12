// This file is generated.

// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of '../maplibre_gl_platform_interface.dart';

FillOptions translateFillOptions(FillOptions options, LatLng delta) {
  if (options.geometry != null) {
    List<List<LatLng>> newGeometry = [];
    for (var ring in options.geometry!) {
      List<LatLng> newRing = [];
      for (var coords in ring) {
        newRing.add(coords + delta);
      }
      newGeometry.add(newRing);
    }
    return options.copyWith(FillOptions(geometry: newGeometry));
  }
  return options;
}

class Fill extends Annotation<FillOptions> {
  Fill(super.id, super.options, [super.data]);

  @override
  void translate(LatLng delta) {
    options = translateFillOptions(options, delta);
  }
}

/// Configuration options for [Fill] instances.
///
/// When used to change configuration, null values will be interpreted as
/// "do not change this configuration option".
class FillOptions implements AnnotationOptions {
  /// Creates a set of fill configuration options.
  ///
  /// By default, every non-specified field is null, meaning no desire to change
  /// fill defaults or current configuration.
  const FillOptions(
      {this.fillOpacity,
      this.fillColor,
      this.fillOutlineColor,
      this.fillPattern,
      this.geometry,
      this.draggable});

  final double? fillOpacity;
  final String? fillColor;
  final String? fillOutlineColor;
  final String? fillPattern;
  final List<List<LatLng>>? geometry;
  final bool? draggable;

  static const FillOptions defaultOptions = FillOptions();

  FillOptions copyWith(FillOptions changes) {
    return FillOptions(
      fillOpacity: changes.fillOpacity ?? fillOpacity,
      fillColor: changes.fillColor ?? fillColor,
      fillOutlineColor: changes.fillOutlineColor ?? fillOutlineColor,
      fillPattern: changes.fillPattern ?? fillPattern,
      geometry: changes.geometry ?? geometry,
      draggable: changes.draggable ?? draggable,
    );
  }

  dynamic toJson([bool addGeometry = true]) {
    final Map<String, dynamic> json = <String, dynamic>{};

    void addIfPresent(String fieldName, dynamic value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    addIfPresent('fillOpacity', fillOpacity);
    addIfPresent('fillColor', fillColor);
    addIfPresent('fillOutlineColor', fillOutlineColor);
    addIfPresent('fillPattern', fillPattern);
    if (addGeometry) {
      addIfPresent(
          'geometry',
          geometry
              ?.map((List<LatLng> latLngList) =>
                  latLngList.map((LatLng latLng) => latLng.toJson()).toList())
              .toList());
    }
    addIfPresent('draggable', draggable);
    return json;
  }

  @override
  Map<String, dynamic> toGeoJson() {
    return {
      "type": "Feature",
      "properties": toJson(false),
      "geometry": {
        "type": "Polygon",
        "coordinates": geometry!
            .map((List<LatLng> latLngList) => latLngList
                .map((LatLng latLng) => latLng.toGeoJsonCoordinates())
                .toList())
            .toList()
      }
    };
  }
}
