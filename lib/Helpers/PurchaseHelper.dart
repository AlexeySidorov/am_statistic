import 'dart:async';
import 'dart:io';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchaseHelper {
  final Set<String> _listProduct =
      Platform.isAndroid ? {'android.test.purchased'} : {'com.cooni.point1000'};
  List<ProductDetails> _products = [];
  final InAppPurchaseConnection _connection = InAppPurchaseConnection.instance;

  StreamSubscription _subscription;

  void init() {
    if (_subscription != null) _subscription.cancel();

    Stream purchaseUpdated =
        InAppPurchaseConnection.instance.purchaseUpdatedStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {});
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {}

        if (Platform.isAndroid) {
          await InAppPurchaseConnection.instance
              .consumePurchase(purchaseDetails);
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchaseConnection.instance
              .completePurchase(purchaseDetails);
        }
      }
    });
  }

  Future<bool> connection() async {
    final bool available = await _connection.isAvailable();
    return available;
  }

  Future<bool> getPurchaseHistory() async {
    QueryPurchaseDetailsResponse response =
        await _connection.queryPastPurchases();

    if (response.error != null) return false;

    for (PurchaseDetails purchase in response.pastPurchases) {
      if (Platform.isIOS) {
        InAppPurchaseConnection.instance.completePurchase(purchase);
      }
    }

    var products = response.pastPurchases;
    return products != null && products.length > 0;
  }

  Future<bool> requestPurchase() async {
    await _getProduct();
    if (_products.length == 0) return false;

    var purchaseParam = PurchaseParam(
        productDetails: _products[0],
        applicationUserName: null,
        sandboxTesting: true);

    return await _connection.buyConsumable(
        purchaseParam: purchaseParam, autoConsume: false);
  }

  Future _getProduct() async {
    final ProductDetailsResponse response = await InAppPurchaseConnection
        .instance
        .queryProductDetails(_listProduct);
    if (response.notFoundIDs.isNotEmpty) {
      return;
    }
    _products = response.productDetails;
  }
}
