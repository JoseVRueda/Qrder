import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/buttons/green_button/green_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'total_bill_model.dart';
export 'total_bill_model.dart';

class TotalBillWidget extends StatefulWidget {
  const TotalBillWidget({
    super.key,
    required this.buttonWidth,
    required this.buttonText,
  });

  final double? buttonWidth;
  final String? buttonText;

  @override
  State<TotalBillWidget> createState() => _TotalBillWidgetState();
}

class _TotalBillWidgetState extends State<TotalBillWidget> {
  late TotalBillModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TotalBillModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 350.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                -2.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: functions
                              .totalQuantity(FFAppState().shoppingCart.toList())
                              .toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        TextSpan(
                          text: ' productos',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Text(
                    formatNumber(
                      functions.totalAmount(FFAppState().shoppingCart.toList()),
                      formatType: FormatType.decimal,
                      decimalType: DecimalType.automatic,
                      currency: '',
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (FFAppState().shoppingCart.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Pago realizado correctamente',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        duration: const Duration(milliseconds: 5000),
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                      ),
                    );

                    await HistoryRecord.collection.doc().set({
                      ...createHistoryRecordData(
                        restaurantName:
                            FFAppState().shoppingCart.first.restaurant,
                        date: getCurrentTimestamp,
                        amount: functions
                            .totalAmount(FFAppState().shoppingCart.toList()),
                        user: currentUserUid,
                      ),
                      ...mapToFirestore(
                        {
                          'products': FFAppState()
                              .shoppingCart
                              .map((e) => e.name)
                              .toList(),
                          'productsCost': FFAppState()
                              .shoppingCart
                              .map((e) => e.price)
                              .toList(),
                        },
                      ),
                    });
                    FFAppState().shoppingCart = [];
                    FFAppState().update(() {});

                    context.goNamed('home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Para hacer una compra debe tener objetos en el carrito',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).error,
                      ),
                    );
                  }
                },
                child: wrapWithModel(
                  model: _model.greenButtonModel,
                  updateCallback: () => safeSetState(() {}),
                  child: GreenButtonWidget(
                    width: widget.buttonWidth,
                    height: 40.0,
                    text: widget.buttonText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
