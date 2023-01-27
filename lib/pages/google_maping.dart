import 'dart:async';
import 'package:elaka_delivery_app/pages/deliver_order.dart';
import 'package:elaka_delivery_app/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapping extends StatefulWidget {
  LatLng? currentLocat;
  LatLng? supLocation;
  int orderId;

  GoogleMapping(this.currentLocat, this.supLocation, this.orderId);

  @override
  State<GoogleMapping> createState() => _GoogleMappingState();
}

class _GoogleMappingState extends State<GoogleMapping> {
  GoogleMapController? _googleMapController;

  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();

  //String googleAPiKey = "";

  Set<Marker> _markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  LatLng? startLocation;
  LatLng? endLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;

  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "images/pin.png")
        .then(
      (icon) {
        sourceIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "images/des_pin.png")
        .then(
      (icon) {
        destinationIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "images/pin.png")
        .then(
      (icon) {
        currentLocationIcon = icon;
      },
    );
  }

  // @override
  // void dispose() {
  //   _googleMapController!.dispose();
  //   super.dispose();
  // }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(32.421950, 74.527792),
    zoom: 11.5,
  );

  Timer? timer;
  @override
  void initState() {
    super.initState();

    startLocation = widget.currentLocat;
    endLocation = widget.supLocation;
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => updateLocation());

    _markers.add(
      Marker(
          markerId: MarkerId("1"),
          position: widget.currentLocat!,
          icon: sourceIcon,
          infoWindow: InfoWindow(
            title: 'source',
            snippet: '',
          )),
    );
    _markers.add(
      Marker(
          markerId: MarkerId("2"),
          position: widget.supLocation!,
          icon: destinationIcon,
          infoWindow: InfoWindow(
            title: '',
            snippet: '',
          )),
    );

    getDirections();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 78, 206, 113),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeliveryOrder(widget.orderId)));
                },
                child: const Text("Delivered",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ))),
          ],
        ),
        body: GoogleMap(
          zoomGesturesEnabled: true, //enable Zoom in, out on map
          initialCameraPosition: CameraPosition(
            //innital position in map
            target: startLocation!, //initial position
            zoom: 16.0, //initial zoom level
          ),
          markers: _markers, //markers to show on map
          polylines: Set<Polyline>.of(polylines.values), //polylines
          mapType: MapType.normal, //map type
          onMapCreated: (controller) {
            //method called when map is created
            setState(() {
              mapController = controller;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          onPressed: () => _googleMapController?.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition),
          ),
          child: const Icon(Icons.center_focus_strong),
        ));
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_map_key,
      PointLatLng(startLocation!.latitude, startLocation!.longitude),
      PointLatLng(endLocation!.latitude, endLocation!.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  void updateLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission != LocationPermission.denied) {
      var position = await GeolocatorPlatform.instance.getCurrentPosition();

      setState(() {
        startLocation = LatLng(position.latitude, position.longitude);
        updateMarker("1");
      });
    } else {
      LocationPermission permission = await Geolocator.requestPermission();
      await GeolocatorPlatform.instance.getCurrentPosition();
      updateLocation();
    }
  }

  updateMarker(String id) {
    final marker = _markers.firstWhere((item) => item.mapsId == MarkerId(id));
    // final marker = _markers.elementAt(index);

    Marker _marker = Marker(
      markerId: marker.markerId,
      onTap: () {
        print("tapped");
      },
      position: LatLng(marker.position.latitude, marker.position.longitude),
      icon: marker.icon,
      infoWindow: InfoWindow(title: ''),
    );

    setState(() {
      //the marker is identified by the markerId and not with the index of the list
      _markers.removeWhere((item) => item.mapsId == id);
      _markers.add(_marker);
    });
  }
}
