import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/auth/presentation/otp_screen.dart';

// KYC Imports
import '../../features/kyc/presentation/npi_input_screen.dart';
import '../../features/kyc/presentation/npi_verification_screen.dart';
import '../../features/kyc/presentation/id_scan_screen.dart';
import '../../features/kyc/presentation/selfie_screen.dart';
import '../../features/kyc/presentation/biometric_setup_screen.dart';
import '../../features/kyc/presentation/pin_creation_screen.dart';
import '../../features/kyc/presentation/kyc_success_screen.dart';

// Main App Imports
import '../../features/main/presentation/main_layout.dart';
import '../../features/medical_profile/presentation/medical_profile_wizard.dart';

// Phase 5 Imports
import '../../features/medical_record/presentation/medical_summary_screen.dart';
import '../../features/medical_record/presentation/vaccination_screen.dart';
import '../../features/medical_record/presentation/lab_results_screen.dart';
import '../../features/medical_record/presentation/prescriptions_screen.dart';
import '../../features/medical_record/presentation/medical_history_screen.dart';

// Phase 6 Imports
import '../../features/pharmacy/presentation/pharmacy_home_screen.dart';
import '../../features/pharmacy/presentation/prescription_scan_screen.dart';
import '../../features/pharmacy/presentation/medication_details_screen.dart';
import '../../features/pharmacy/presentation/pharmacy_cart_screen.dart';
import '../../features/pharmacy/presentation/order_tracking_screen.dart';

// Phase 7 Imports
import '../../features/insurance/presentation/insurance_dashboard_screen.dart';
import '../../features/insurance/presentation/insurance_packages_screen.dart';
import '../../features/insurance/presentation/premium_payment_screen.dart';
import '../../features/insurance/presentation/contributions_history_screen.dart';
import '../../features/insurance/presentation/reimbursements_screen.dart';

// Phase 8 Imports
import '../../features/teleconsultation/presentation/waiting_room_screen.dart';
import '../../features/teleconsultation/presentation/video_call_screen.dart';
import '../../features/teleconsultation/presentation/chat_consultation_screen.dart';
import '../../features/teleconsultation/presentation/consultation_summary_screen.dart';

// Phase 9 Imports
import '../../features/emergency/presentation/sos_screen.dart';
import '../../features/emergency/presentation/sos_map_screen.dart';
import '../../features/emergency/presentation/emergency_tracking_screen.dart';
import '../../features/emergency/presentation/ambulance_assigned_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/otp',
        name: 'otp',
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: '/kyc/npi',
        name: 'npi_input',
        builder: (context, state) => const NpiInputScreen(),
      ),
      GoRoute(
        path: '/kyc/npi-verify',
        name: 'npi_verify',
        builder: (context, state) => NpiVerificationScreen(nip: state.extra as String?),
      ),
      GoRoute(
        path: '/kyc/id-scan',
        name: 'id_scan',
        builder: (context, state) => const IdScanScreen(),
      ),
      GoRoute(
        path: '/kyc/selfie',
        name: 'selfie',
        builder: (context, state) => const SelfieScreen(),
      ),
      GoRoute(
        path: '/kyc/biometric',
        name: 'biometric',
        builder: (context, state) => const BiometricSetupScreen(),
      ),
      GoRoute(
        path: '/kyc/pin',
        name: 'pin_creation',
        builder: (context, state) => const PinCreationScreen(),
      ),
      GoRoute(
        path: '/kyc/success',
        name: 'kyc_success',
        builder: (context, state) => const KycSuccessScreen(),
      ),
      GoRoute(
        path: '/main',
        name: 'main',
        builder: (context, state) => const MainLayout(),
      ),
      GoRoute(
        path: '/medical-profile',
        name: 'medical_profile',
        builder: (context, state) => const MedicalProfileWizardScreen(),
      ),
      GoRoute(
        path: '/medical-summary',
        name: 'medical_summary',
        builder: (context, state) => const MedicalSummaryScreen(),
      ),
      GoRoute(
        path: '/vaccinations',
        name: 'vaccinations',
        builder: (context, state) => const VaccinationScreen(),
      ),
      GoRoute(
        path: '/lab-results',
        name: 'lab_results',
        builder: (context, state) => const LabResultsScreen(),
      ),
      GoRoute(
        path: '/prescriptions',
        name: 'prescriptions',
        builder: (context, state) => const PrescriptionsScreen(),
      ),
      GoRoute(
        path: '/pharmacy',
        name: 'pharmacy_home',
        builder: (context, state) => const PharmacyHomeScreen(),
      ),
      GoRoute(
        path: '/pharmacy/scan',
        name: 'prescription_scan',
        builder: (context, state) => const PrescriptionScanScreen(),
      ),
      GoRoute(
        path: '/pharmacy/medication',
        name: 'medication_details',
        builder: (context, state) => const MedicationDetailsScreen(),
      ),
      GoRoute(
        path: '/pharmacy-cart',
        name: 'pharmacy_cart',
        builder: (context, state) => const PharmacyCartScreen(),
      ),
      GoRoute(
        path: '/insurance',
        name: 'insurance_dashboard',
        builder: (context, state) => const InsuranceDashboardScreen(),
      ),
      GoRoute(
        path: '/insurance/packages',
        name: 'insurance_packages',
        builder: (context, state) => const InsurancePackagesScreen(),
      ),
      GoRoute(
        path: '/insurance/payment',
        name: 'insurance_payment',
        builder: (context, state) => const PremiumPaymentScreen(),
      ),
      GoRoute(
        path: '/insurance/contributions',
        name: 'insurance_contributions',
        builder: (context, state) => const ContributionsHistoryScreen(),
      ),
      GoRoute(
        path: '/teleconsultation/waiting',
        name: 'teleconsultation_waiting',
        builder: (context, state) => const WaitingRoomScreen(),
      ),
      GoRoute(
        path: '/teleconsultation/video',
        name: 'teleconsultation_video',
        builder: (context, state) => const VideoCallScreen(),
      ),
      GoRoute(
        path: '/teleconsultation/chat',
        name: 'teleconsultation_chat',
        builder: (context, state) => const ChatConsultationScreen(),
      ),
      GoRoute(
        path: '/teleconsultation/summary',
        name: 'teleconsultation_summary',
        builder: (context, state) => const ConsultationSummaryScreen(),
      ),

      // Phase 9: Urgences
      GoRoute(
        path: '/sos',
        name: 'sos_home',
        builder: (context, state) => const SosScreen(),
      ),
      GoRoute(
        path: '/sos/map',
        name: 'sos_map',
        builder: (context, state) => const SosMapScreen(),
      ),
      GoRoute(
        path: '/sos/tracking',
        name: 'sos_tracking',
        builder: (context, state) => const EmergencyTrackingScreen(),
      ),
      GoRoute(
        path: '/sos/assigned',
        name: 'sos_assigned',
        builder: (context, state) => const AmbulanceAssignedScreen(),
      ),
    ],
  );
}
