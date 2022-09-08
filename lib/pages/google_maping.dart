import 'dart:async';
import 'package:elaka_delivery_app/pages/deliver_order.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleMapping extends StatefulWidget {
  const GoogleMapping({Key? key}) : super(key: key);

  @override
  State<GoogleMapping> createState() => _GoogleMappingState();
}

class _GoogleMappingState extends State<GoogleMapping> {
    GoogleMapController? _googleMapController;

    @override
    void dispose(){
      _googleMapController!.dispose();
      super.dispose();
    }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(32.421950, 74.527792),
    zoom: 11.5,
    );


    // List<Marker> _marker = [];
    // List<Marker> _list = const [
    //   Marker(markerId: MarkerId("1"),
    //   position: LatLng(32.421950, 74.527792),
    //   infoWindow: InfoWindow(
    //     title: "Current Location"
    //   )
    //   ),

    //   Marker(markerId: MarkerId("2"),
    //   position: LatLng(32.435384, 74.530493),
    //   infoWindow: InfoWindow(
    //     title: "Destination"
    //   )
    //   )
    // ];

    final Set<Marker> _markers ={};
    final Set<Polyline> _polyline = {};


    List<LatLng> latlng = [
      LatLng(32.421950, 74.527792),
      LatLng(32.482877, 74.595323),

    ];


    @override
  void initState() {
    super.initState();
    // _marker.addAll(_list);


    for(int i=0; i<latlng.length; i++){
      _markers.add(
        Marker(markerId: MarkerId(i.toString()),
        position: latlng[i],
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 star Rating',
        )
        ),
        
      );
      setState(() {
      
    });
    _polyline.add(
      Polyline(polylineId: PolylineId('1'),
      points: latlng,
      color: Colors.blue,
      width: 3,
      
      ),
      
    );
    }

    
    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 78,206,113),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => DeliveryOrder() ));
          }, child: const Text("Delivered", style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ))),
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        // markers: Set.of(_marker),
        markers: _markers,
        polylines: _polyline,
         onMapCreated: (controller) => _googleMapController = controller,
        
        
        
        ),
        floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController?.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
         child: const Icon(Icons.center_focus_strong),)
    );
  }
}