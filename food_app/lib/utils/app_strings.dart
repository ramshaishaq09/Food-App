/// All user-facing strings live here so the UI never hardcodes text
/// directly. Call these as `AppStrings.welcomeBack` etc. from widgets.
/// Grouped by page/section with a comment header for easy navigation.
class AppStrings {
  AppStrings._(); // prevent instantiation — this is a static-only class

  // ---- App ----
  static const appName = 'AWFOODS';

  // ---- Login page ----
  static const welcomeBack = 'Welcome back';
  static const loginSubtitle = 'Sign in to order your favorite meals.';
  static const emailLabel = 'Email';
  static const emailHint = 'you@example.com';
  static const emailRequiredError = 'Email is required';
  static const emailInvalidError = 'Enter a valid email';
  static const passwordLabel = 'Password';
  static const passwordHint = 'Enter your password';
  static const passwordMinLengthError = 'Minimum 6 characters';
  static const forgotPassword = 'Forgot password?';
  static const logIn = 'Log In';
  static const noAccountPrompt = "Don't have an account?";
  static const signUp = 'Sign up';
  static const demoEmail = 'ayzawaseem19@gmail.com';
  static const demoPassword = 'AYZA1234';

  // ---- Signup page ----
  static const createAccount = 'Create account';
  static const signupSubtitle = 'Sign up to start ordering your favorite meals.';
  static const fullNameLabel = 'Full name';
  static const fullNameHint = 'Your name';
  static const fullNameRequiredError = 'Name is required';
  static const confirmPasswordLabel = 'Confirm password';
  static const confirmPasswordHint = 'Re-enter your password';
  static const confirmPasswordError = 'Passwords do not match';
  static const signUpButton = 'Sign Up';
  static const haveAccountPrompt = 'Already have an account?';

  // ---- Home page ----
  static const greeting = 'Good afternoon ayza';
  static const findGreatDeals = 'What are you craving?';
  static const searchHint = 'Search dishes...';
  static const noItemsFound = 'No dishes found';
  static const allCategory = 'All';
  static String addedToCart(String itemName) => '$itemName added to cart';

  // ---- Profile page ----
  static const profile = 'Profile';
  static const demoUserName = 'Ayza Waseem';
  static const ordersLabel = 'Orders';
  static const wishlistLabel = 'Favorites';
  static const reviewsLabel = 'Reviews';
  static const settings = 'Settings';
  static const orderHistory = 'Order History';
  static const shippingAddress = 'Delivery Address';
  static const paymentMethods = 'Payment Methods';
  static const notifications = 'Notifications';
  static const helpAndSupport = 'Help & Support';
  static const logOut = 'Log Out';

  // ---- Menu item card ----
  static const hotBadge = 'POPULAR';
}
