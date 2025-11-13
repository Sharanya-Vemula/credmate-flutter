import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import providers
import 'providers/product_provider.dart';
import 'providers/loan_provider.dart';
import 'providers/user_provider.dart';

// Import screens
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/approval_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/repayment_screen.dart';

// Import theme
import 'app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CredMateApp());
}

class CredMateApp extends StatelessWidget {
  const CredMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => LoanProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CredMate',
        theme: AppTheme.light(),
        initialRoute: '/splash',
        routes: {
          '/splash': (_) => SplashScreen(),
          '/': (_) => HomeScreen(),
          ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
          CheckoutScreen.routeName: (_) => CheckoutScreen(),
          ApprovalScreen.routeName: (_) => ApprovalScreen(),
          DashboardScreen.routeName: (_) => DashboardScreen(),
          RepaymentScreen.routeName: (_) => RepaymentScreen(),
        },
      ),
    );
  }
}
