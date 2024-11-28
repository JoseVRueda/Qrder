import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'restaurantinfo_model.dart';
export 'restaurantinfo_model.dart';

class RestaurantinfoWidget extends StatefulWidget {
  const RestaurantinfoWidget({
    super.key,
    required this.name,
    required this.distanceinminutes,
    required this.rating,
    this.photoUrl,
  });

  final String? name;
  final int? distanceinminutes;
  final double? rating;
  final String? photoUrl;

  @override
  State<RestaurantinfoWidget> createState() => _RestaurantinfoWidgetState();
}

class _RestaurantinfoWidgetState extends State<RestaurantinfoWidget> {
  late RestaurantinfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestaurantinfoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      height: 75.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.photoUrl!,
              width: 140.0,
              height: 75.0,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.name,
                  'restaurant name',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                    child: Icon(
                      Icons.access_time,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 12.0,
                    ),
                  ),
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: valueOrDefault<String>(
                            widget.distanceinminutes?.toString(),
                            '0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        TextSpan(
                          text: ' min',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                  ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Roboto',
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 2.0),
                    child: Icon(
                      Icons.directions_car_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 12.0,
                    ),
                  ),
                ].divide(const SizedBox(width: 2.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  RatingBarIndicator(
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: FlutterFlowTheme.of(context).warning,
                    ),
                    direction: Axis.horizontal,
                    rating: widget.rating!,
                    unratedColor: FlutterFlowTheme.of(context).alternate,
                    itemCount: 1,
                    itemSize: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.rating?.toString(),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Roboto',
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ].divide(const SizedBox(width: 2.0)),
              ),
            ].divide(const SizedBox(height: 4.0)),
          ),
        ].divide(const SizedBox(width: 10.0)),
      ),
    );
  }
}
