import '/backend/backend.dart';
import '/buttons/green_button/green_button_widget.dart';
import '/buttons/help_button/help_button_widget.dart';
import '/buttons/white_button/white_button_widget.dart';
import '/components/navigation_bar_bottom/navigation_bar_bottom_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'confirm_restaurant_qr_model.dart';
export 'confirm_restaurant_qr_model.dart';

class ConfirmRestaurantQrWidget extends StatefulWidget {
  /// This page appears when the user scans a QR code to confirm it's reading
  /// the correct code of the respective restaurant.
  const ConfirmRestaurantQrWidget({
    super.key,
    required this.restaurantId,
    this.tableNum,
  });

  final String? restaurantId;
  final String? tableNum;

  @override
  State<ConfirmRestaurantQrWidget> createState() =>
      _ConfirmRestaurantQrWidgetState();
}

class _ConfirmRestaurantQrWidgetState extends State<ConfirmRestaurantQrWidget>
    with TickerProviderStateMixin {
  late ConfirmRestaurantQrModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmRestaurantQrModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 50.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RestaurantsRecord>>(
      stream: queryRestaurantsRecord(
        queryBuilder: (restaurantsRecord) => restaurantsRecord.where(
          'restaurantId',
          isEqualTo: widget.restaurantId,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<RestaurantsRecord> confirmRestaurantQrRestaurantsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final confirmRestaurantQrRestaurantsRecord =
            confirmRestaurantQrRestaurantsRecordList.isNotEmpty
                ? confirmRestaurantQrRestaurantsRecordList.first
                : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 350.0,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.chevron_left_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 32.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                          wrapWithModel(
                            model: _model.helpButtonModel,
                            updateCallback: () => safeSetState(() {}),
                            child: const HelpButtonWidget(),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              Theme.of(context).brightness == Brightness.dark
                                  ? 'assets/images/LogoDark.png'
                                  : 'assets/images/Logo.png',
                              width: 144.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: 270.0,
                            height: 160.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                  spreadRadius: 4.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Te encuentras en',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        confirmRestaurantQrRestaurantsRecord
                                            ?.name,
                                        'nombreRestaurante',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                confirmRestaurantQrRestaurantsRecord
                                                    ?.address,
                                                'dirección',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Icon(
                                              Icons.location_on_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 12.0,
                                            ),
                                          ].divide(const SizedBox(width: 2.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                widget.tableNum,
                                                'tableNum',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Icon(
                                              Icons.table_bar_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 12.0,
                                            ),
                                          ].divide(const SizedBox(width: 2.0)),
                                        ),
                                      ].divide(const SizedBox(width: 20.0)),
                                    ),
                                  ].divide(const SizedBox(height: 2.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'menu',
                                          queryParameters: {
                                            'restaurantId': serializeParam(
                                              widget.restaurantId,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: wrapWithModel(
                                        model: _model.greenButtonModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: const GreenButtonWidget(
                                          width: 100.0,
                                          height: 41.0,
                                          text: 'Confirmar',
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('home');
                                      },
                                      child: wrapWithModel(
                                        model: _model.whiteButtonModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: const WhiteButtonWidget(
                                          width: 100.0,
                                          height: 40.0,
                                          text: 'Cancelar',
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                              ].divide(const SizedBox(height: 15.0)),
                            ),
                          ),
                        ],
                      ),
                      wrapWithModel(
                        model: _model.navigationBarBottomModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NavigationBarBottomWidget(
                          homeState: Icon(
                            FFIcons.ktypeHomeStateDefault,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          cartState: Icon(
                            Icons.shopping_cart_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          historyState: Icon(
                            FFIcons.ktypeHistoryStateDefault,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
