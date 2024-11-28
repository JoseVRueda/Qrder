import '/buttons/help_button/help_button_widget.dart';
import '/components/cart_item/cart_item_widget.dart';
import '/components/empty_cart/empty_cart_widget.dart';
import '/components/total_bill/total_bill_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'shopping_cart_model.dart';
export 'shopping_cart_model.dart';

class ShoppingCartWidget extends StatefulWidget {
  const ShoppingCartWidget({
    super.key,
    required this.restaurantName,
  });

  final String? restaurantName;

  @override
  State<ShoppingCartWidget> createState() => _ShoppingCartWidgetState();
}

class _ShoppingCartWidgetState extends State<ShoppingCartWidget>
    with TickerProviderStateMixin {
  late ShoppingCartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShoppingCartModel());

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
    context.watch<FFAppState>();

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
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.notifications_active_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 32.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                  Container(
                    height: 610.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Carrito de compras',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 380.0,
                          decoration: const BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final shoppingCart = FFAppState()
                                  .shoppingCart
                                  .map((e) => e)
                                  .toList();
                              if (shoppingCart.isEmpty) {
                                return const Center(
                                  child: EmptyCartWidget(),
                                );
                              }

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: shoppingCart.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 10.0),
                                itemBuilder: (context, shoppingCartIndex) {
                                  final shoppingCartItem =
                                      shoppingCart[shoppingCartIndex];
                                  return wrapWithModel(
                                    model: _model.cartItemModels.getModel(
                                      shoppingCartItem.name,
                                      shoppingCartIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: CartItemWidget(
                                      key: Key(
                                        'Key937_${shoppingCartItem.name}',
                                      ),
                                      image: shoppingCartItem.image,
                                      name: shoppingCartItem.name,
                                      preferences: shoppingCartItem.preferences,
                                      price: shoppingCartItem.price,
                                      quantity: shoppingCartItem.quantity,
                                      indexToRemove: shoppingCartIndex,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ].divide(const SizedBox(height: 15.0)),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.totalBillModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const TotalBillWidget(
                      buttonWidth: 70.0,
                      buttonText: 'Pagar',
                    ),
                  ),
                ].divide(const SizedBox(height: 10.0)),
              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
            ),
          ),
        ),
      ),
    );
  }
}
