// This file is generated.

// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of '../maplibre_gl_platform_interface.dart';

class Line extends Annotation<LineOptions> {
  Line(super.id, super.options, [super.data]);

  @override
  void translate(LatLng delta) {
    options = options.copyWith(LineOptions(
        geometry: options.geometry?.map((e) => e + delta).toList()));
  }
}

/// Configuration options for [Line] instances.
///
/// When used to change configuration, null values will be interpreted as
/// "do not change this configuration option".
class LineOptions implements AnnotationOptions {
  /// Creates a set of line configuration options.
  ///
  /// By default, every non-specified field is null, meaning no desire to change
  /// line defaults or current configuration.
  const LineOptions({
    this.lineJoin,
    this.lineOpacity,
    this.lineColor,
    this.lineWidth,
    this.lineGapWidth,
    this.lineOffset,
    this.lineBlur,
    this.linePattern,
    this.geometry,
    this.draggable,
  });

  final String? lineJoin;
  final double? lineOpacity;
  final String? lineColor;
  final double? lineWidth;
  final double? lineGapWidth;
  final double? lineOffset;
  final double? lineBlur;
  final String? linePattern;
  final List<LatLng>? geometry;
  final bool? draggable;

  static const LineOptions defaultOptions = LineOptions();

  LineOptions copyWith(LineOptions changes) {
    return LineOptions(
      lineJoin: changes.lineJoin ?? lineJoin,
      lineOpacity: changes.lineOpacity ?? lineOpacity,
      lineColor: changes.lineColor ?? lineColor,
      lineWidth: changes.lineWidth ?? lineWidth,
      lineGapWidth: changes.lineGapWidth ?? lineGapWidth,
      lineOffset: changes.lineOffset ?? lineOffset,
      lineBlur: changes.lineBlur ?? lineBlur,
      linePattern: changes.linePattern ?? linePattern,
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

    addIfPresent('lineJoin', lineJoin);
    addIfPresent('lineOpacity', lineOpacity);
    addIfPresent('lineColor', lineColor);
    addIfPresent('lineWidth', lineWidth);
    addIfPresent('lineGapWidth', lineGapWidth);
    addIfPresent('lineOffset', lineOffset);
    addIfPresent('lineBlur', lineBlur);
    addIfPresent('linePattern', linePattern);
    if (addGeometry) {
      addIfPresent('geometry',
          geometry?.map((LatLng latLng) => latLng.toJson()).toList());
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
        "type": "LineString",
        "coordinates": geometry!.map((c) => c.toGeoJsonCoordinates()).toList()
      }
    };
  }
}
