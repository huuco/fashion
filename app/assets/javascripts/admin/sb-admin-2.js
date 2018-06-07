$(document).ready(function() {
  $("#product_old_price").change(function() {
    caculator_price()
  });
  $("#product_discount").change(function() {
    caculator_price();
  });

  function caculator_price() {
    var old_price = parseFloat($("#product_old_price").val());
    var discount = parseFloat($("#product_discount").val());
    if (discount>=0 && discount <= 100) {
      price = old_price * (100 - discount) / 100
      $("#product_price").val(price);
    } else {
      alert(I18n.t("enter_again"));
      $("#product_discount").val(0);
      caculator_price();
    }
  }

  $(".active_product").click(function(){
    var active = $(this).val() == "true" ? 0 : 1;
    var url = $(this).attr("url");
    $.ajax({
      url: url,
      type: "POST",
      data: {
        active: active
      },
      success: function (result){
        $(".active_product_" + result.id).val(result.active);
      }
    });
  });
});
