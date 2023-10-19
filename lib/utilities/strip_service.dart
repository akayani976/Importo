import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stripe_checkout/stripe_checkout.dart';

class StripService {
  static String publishableKey =
      "pk_test_51O2DZhKKLQ3DdJ2S6PCvWcgT22FtLigXxyp4KIWC5u2Y0TEVqri7RbwlmNrC4MI92D4UYMBMcYXI0oH50hzNJgJx00xpafFoiq";
  static String secretKey =
      "sk_test_51O2DZhKKLQ3DdJ2Sn7q9SQjZiPSARuWelHPmV46hjpPQfVezd6AWy4mKJtfvOvW3iFVzFNT8gW3LND36ONAiIToX00Y6yttJW4 ";

  static Future<dynamic> createCheckOutSession(
    List<dynamic> productItems,
    totalAmount,
  ) async {
    final url = Uri.parse("https://api.stripe.com/v1/checkout/sessions");

    String lineItems = "";
    int index = 0;

    for (var element in productItems) {
      var productPrice = (element["productPrice"] * 100).round().toString();
      lineItems +=
          "&line_items[$index][price_data][product_data][name]=${element['productName']}";
      lineItems += "&line_items[$index][price_data][unit_amount]=$productPrice";
      lineItems += "&line_items[$index][price_data][currency]=USD";
      lineItems += "&line_items[$index][quantity]=${element['qty'].toString()}";
      index++;
    }

    final response = await http.post(url,
        body:
            "success_url=https://checkout.stripe.dev/success&mode=payment$lineItems",
        headers: {
          "Authorization": "Bearer $secretKey",
          "Content-Type": "application/x-www-form-urlencoded"
        });
    return json.decode(response.body)["id"];
  }

  static Future<dynamic> stripePaymentCheckout(
    productItems,
    subTotal,
    context, {
    onSuccess,
    onCancel,
    onError,
  }) async {
    final String sessionId =
        await createCheckOutSession(productItems, subTotal);
    final result = await redirectToCheckout(
      context: context,
      sessionId: sessionId,
      publishableKey: publishableKey,
      successUrl: "https://checkout.stripe.dev/success",
      canceledUrl: "https://checkout.stripe.dev/cancel",
    );
    if (context.mounted) {
      final text = result.when(
        redirected: () => "Redirected Scucessfully",
        success: () => onSuccess(),
        canceled: () => onCancel(),
        error: (e) => onError(e),
      );
      return text;
    }
  }
}
