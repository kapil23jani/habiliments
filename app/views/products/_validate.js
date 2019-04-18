$("#product_for").validate({
  //error place
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
    "product[product_name]":{
      required: true,
      maxlength: 20,
      minlength: 6
    },
    "product[product_cover_pic]":{
      required: true,
      maxlength: 20,
      minlength: 6
    },
  },
  messages: {
    "product[product_name]":{
      required: "Require"
    },
    "product[product_cover_pic]":{
      required: "Require"
    },
  }
});