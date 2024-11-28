import '/backend/backend.dart';
import '/buttons/help_button/help_button_widget.dart';
import '/components/product/product_widget.dart';
import '/components/total_cart/total_cart_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'menu_model.dart';
export 'menu_model.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    super.key,
    String? restaurantId,
  }) : restaurantId = restaurantId ?? 'porthos53';

  final String restaurantId;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> with TickerProviderStateMixin {
  late MenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.categories = await actions.getUniqueCategories(
        widget.restaurantId,
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
        List<RestaurantsRecord> menuRestaurantsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final menuRestaurantsRecord = menuRestaurantsRecordList.isNotEmpty
            ? menuRestaurantsRecordList.first
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
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
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
                            borderColor: Colors.transparent,
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
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  menuRestaurantsRecord!.photoUrl,
                                  width: 200.0,
                                  height: 160.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        menuRestaurantsRecord.name,
                                        'name',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Dirección',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 16.0,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          menuRestaurantsRecord.address,
                                          'address',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Calificación',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Icon(
                                            Icons.star_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 16.0,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        formatNumber(
                                          menuRestaurantsRecord.rating,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 340.0,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Buscar un producto',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    suffixIcon: Icon(
                                      Icons.search_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Container(
                                width: 350.0,
                                height: 291.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: StreamBuilder<List<ProductRecord>>(
                                  stream: queryProductRecord(
                                    queryBuilder: (productRecord) =>
                                        productRecord.where(
                                      'restaurantId',
                                      isEqualTo: widget.restaurantId != ''
                                          ? widget.restaurantId
                                          : null,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ProductRecord>
                                        tabBarProductRecordList =
                                        snapshot.data!;

                                    return Column(
                                      children: [
                                        Align(
                                          alignment: const Alignment(0.0, 0),
                                          child: TabBar(
                                            isScrollable: true,
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      letterSpacing: 0.0,
                                                    ),
                                            unselectedLabelStyle: const TextStyle(),
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            indicatorWeight: 2.0,
                                            tabs: [
                                              const Tab(
                                                text: 'Todo',
                                              ),
                                              Tab(
                                                text: _model.categories![0],
                                              ),
                                              Tab(
                                                text: _model.categories![1],
                                              ),
                                            ],
                                            controller: _model.tabBarController,
                                            onTap: (i) async {
                                              [
                                                () async {},
                                                () async {},
                                                () async {}
                                              ][i]();
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            controller: _model.tabBarController,
                                            children: [
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final allProducts =
                                                                tabBarProductRecordList
                                                                    .map((e) =>
                                                                        e)
                                                                    .toList();

                                                            return GridView
                                                                .builder(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                5.0,
                                                                0,
                                                                5.0,
                                                              ),
                                                              gridDelegate:
                                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    2,
                                                                crossAxisSpacing:
                                                                    5.0,
                                                                mainAxisSpacing:
                                                                    5.0,
                                                                childAspectRatio:
                                                                    0.7,
                                                              ),
                                                              primary: false,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  allProducts
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  allProductsIndex) {
                                                                final allProductsItem =
                                                                    allProducts[
                                                                        allProductsIndex];
                                                                return wrapWithModel(
                                                                  model: _model
                                                                      .productModels1
                                                                      .getModel(
                                                                    allProductsItem
                                                                        .reference
                                                                        .id,
                                                                    allProductsIndex,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      ProductWidget(
                                                                    key: Key(
                                                                      'Key3uv_${allProductsItem.reference.id}',
                                                                    ),
                                                                    name: allProductsItem
                                                                        .name,
                                                                    ingredients:
                                                                        functions.joinWithCommas(allProductsItem
                                                                            .ingredients
                                                                            .toList()),
                                                                    price: allProductsItem
                                                                        .price,
                                                                    photo: allProductsItem
                                                                        .photo,
                                                                    index: functions.isProductInCart(FFAppState().shoppingCart.toList(), allProductsItem.name) ==
                                                                            true
                                                                        ? functions.getIndexByName(
                                                                            FFAppState().shoppingCart.toList(),
                                                                            allProductsItem.name)
                                                                        : 403,
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final filter1 =
                                                                tabBarProductRecordList
                                                                    .where((e) =>
                                                                        e.category ==
                                                                        (_model.categories?[
                                                                            0]))
                                                                    .toList();

                                                            return GridView
                                                                .builder(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                5.0,
                                                                0,
                                                                5.0,
                                                              ),
                                                              gridDelegate:
                                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    2,
                                                                crossAxisSpacing:
                                                                    10.0,
                                                                mainAxisSpacing:
                                                                    10.0,
                                                                childAspectRatio:
                                                                    0.7,
                                                              ),
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount: filter1
                                                                  .length,
                                                              itemBuilder: (context,
                                                                  filter1Index) {
                                                                final filter1Item =
                                                                    filter1[
                                                                        filter1Index];
                                                                return wrapWithModel(
                                                                  model: _model
                                                                      .productModels2
                                                                      .getModel(
                                                                    filter1Item
                                                                        .reference
                                                                        .id,
                                                                    filter1Index,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      ProductWidget(
                                                                    key: Key(
                                                                      'Key58t_${filter1Item.reference.id}',
                                                                    ),
                                                                    name: filter1Item
                                                                        .name,
                                                                    ingredients:
                                                                        functions.joinWithCommas(filter1Item
                                                                            .ingredients
                                                                            .toList()),
                                                                    price: filter1Item
                                                                        .price,
                                                                    photo: filter1Item
                                                                        .photo,
                                                                    index: functions.isProductInCart(FFAppState().shoppingCart.toList(), filter1Item.name) ==
                                                                            true
                                                                        ? functions.getIndexByName(
                                                                            FFAppState().shoppingCart.toList(),
                                                                            filter1Item.name)
                                                                        : 403,
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final filter2 =
                                                                tabBarProductRecordList
                                                                    .where((e) =>
                                                                        e.category ==
                                                                        (_model.categories?[
                                                                            1]))
                                                                    .toList();

                                                            return GridView
                                                                .builder(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                5.0,
                                                                0,
                                                                5.0,
                                                              ),
                                                              gridDelegate:
                                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    2,
                                                                crossAxisSpacing:
                                                                    5.0,
                                                                mainAxisSpacing:
                                                                    5.0,
                                                                childAspectRatio:
                                                                    0.72,
                                                              ),
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount: filter2
                                                                  .length,
                                                              itemBuilder: (context,
                                                                  filter2Index) {
                                                                final filter2Item =
                                                                    filter2[
                                                                        filter2Index];
                                                                return wrapWithModel(
                                                                  model: _model
                                                                      .productModels3
                                                                      .getModel(
                                                                    filter2Item
                                                                        .reference
                                                                        .id,
                                                                    filter2Index,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      ProductWidget(
                                                                    key: Key(
                                                                      'Keyy4i_${filter2Item.reference.id}',
                                                                    ),
                                                                    name: filter2Item
                                                                        .name,
                                                                    ingredients:
                                                                        functions.joinWithCommas(filter2Item
                                                                            .ingredients
                                                                            .toList()),
                                                                    price: filter2Item
                                                                        .price,
                                                                    photo: filter2Item
                                                                        .photo,
                                                                    index: functions.isProductInCart(FFAppState().shoppingCart.toList(), filter2Item.name) ==
                                                                            true
                                                                        ? functions.getIndexByName(
                                                                            FFAppState().shoppingCart.toList(),
                                                                            filter2Item.name)
                                                                        : 403,
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ].divide(const SizedBox(height: 15.0)),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.totalCartModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const TotalCartWidget(
                          buttonWidth: 100.0,
                          buttonText: 'Ver Carrito',
                        ),
                      ),
                    ].divide(const SizedBox(height: 10.0)),
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
