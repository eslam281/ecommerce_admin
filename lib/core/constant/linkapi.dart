class AppLink{

  static const String server = "http://10.0.2.2/ecommerce"; //10.0.2.2 =localhost very important

  static const String test ="$server/test.php";

  // ============================== Image =================================//

  static const String imageststatic = "$server/upload"; //10.0.2.2 =localhost very important

  // ============================== Auth =================================//
  static const String login ="$server/admin/auth/login.php";
  static const String signup ="$server/admin/auth/signup.php";
  static const String verfiycode ="$server/admin/auth/verfiycode.php";
  static const String resend ="$server/admin/auth/resend.php";

// ============================== ForgetPassword =================================//
  static const String forgetpassword ="$server/admin/forgetpassword/checkemail.php";
  static const String verfiycode_password ="$server/admin/forgetpassword/verfiycode.php";
  static const String resetpassword ="$server/admin/forgetpassword/resetpassword.php";

// ============================== Home =================================//
  static const String pending ="$server/admin/orders/view.php";
  static const String archive ="$server/admin/orders/archive.php";
  static const String acceptedOrders ="$server/admin/orders/accepted.php";
  static const String approveOrders ="$server/admin/orders/approve.php";
  static const String doneOrders ="$server/admin/orders/done.php";
  static const String ordersdetails ="$server/orders/details.php";


}