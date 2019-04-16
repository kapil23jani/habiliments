$("#new_sellerprofile").validate({
  //error place
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
//adding rule
  rules: {
  // username is required with max of 20 and min of 6
    "sellerprofile[name]":{
      required: true,
      maxlength: 20,
      minlength: 6
    },
    "sellerprofile[trade_licence]":{
      required: true,
    },
    "sellerprofile[gst_no]":{
      required: true,
    },
    "sellerprofile[sales_tax]":{
      required: true,  
    },
  },
  messages: {
    "sellerprofile[name]":{
      required: "Require"
    },
    "sellerprofile[trade_licence]":{
      required: "Require"
    },
    "sellerprofile[gst_no]":{
      required: "Require",
    },
    "sellerprofile[sales_tax]":{
      required: "Require",  
    },
  }
});