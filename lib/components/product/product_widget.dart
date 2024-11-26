import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_model.dart';
export 'product_model.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.name,
    required this.ingredients,
    required this.price,
    required this.photo,
    required this.index,
  });

  final String? name;
  final String? ingredients;
  final int? price;
  final String? photo;
  final int? index;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  late ProductModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 155.0,
      height: 210.0,
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
          color: FlutterFlowTheme.of(context).secondaryText,
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.photo!,
                width: 155.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140.0,
                  height: 70.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.name,
                          'name',
                        ),
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      AutoSizeText(
                        valueOrDefault<String>(
                          widget.ingredients,
                          'ingredients',
                        ),
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          formatNumber(
                            widget.price,
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.automatic,
                            currency: '',
                          ),
                          'price',
                        ),
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Roboto',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).error,
                icon: Icon(
                  Icons.remove_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
                onPressed: () async {
                  if (functions.isProductInCart(
                          FFAppState().shoppingCart.toList(), widget.name!) ==
                      true) {
                    if (functions.isProductRemovable(
                        FFAppState().shoppingCart.toList(), widget.name!)) {
                      // removeItemFromShoppingCart
                      FFAppState().removeFromShoppingCart(
                          FFAppState().shoppingCart[widget.index!]);
                      FFAppState().update(() {});
                    } else {
                      // decreaseItemQuantity
                      FFAppState().updateShoppingCartAtIndex(
                        widget.index!,
                        (e) => e..incrementQuantity(-1),
                      );
                      FFAppState().update(() {});
                    }
                  }
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.add_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
                onPressed: () async {
                  if (functions.isProductInCart(
                          FFAppState().shoppingCart.toList(), widget.name!) ==
                      true) {
                    // increaseItemQuantity
                    FFAppState().updateShoppingCartAtIndex(
                      widget.index!,
                      (e) => e..incrementQuantity(1),
                    );
                    FFAppState().update(() {});
                  } else {
                    // addItemToShoppingCart
                    FFAppState().addToShoppingCart(ProductStruct(
                      name: widget.name,
                      quantity: 1,
                      image: widget.photo,
                      preferences: widget.ingredients,
                      price: widget.price?.toDouble(),
                    ));
                    FFAppState().update(() {});
                  }
                },
              ),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  widget.index != 403
                      ? FFAppState()
                          .shoppingCart[widget.index!]
                          .quantity
                          .toString()
                      : '0',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ].divide(const SizedBox(width: 10.0)),
          ),
        ].divide(const SizedBox(height: 0.0)),
      ),
    );
  }
}
