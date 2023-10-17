mixin PriceCheck {
  String? checkPrice(String? value) {
    if (value!.isEmpty) {
      return "من فضلك ادخل المبلغ";
    } else if (!(int.parse(value) > 0)) {
      return "من فضلك ادخل المبلغ بشكل صحيح";
    }
    return null;
  }
}
