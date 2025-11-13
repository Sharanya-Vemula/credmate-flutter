# 💳 CredMate – BNPL Demo App (Flutter)

A **Buy Now Pay Later (BNPL)** demo app built with **Flutter**, inspired by fintech products like **CRED** and **Simpl**.  
It simulates the BNPL experience with mock credit checks, EMI breakdown, repayment tracking, and a dashboard view — built for portfolio and interview showcases.

---

## Features

✅ Product listing with image previews  
✅ Product detail & checkout with adjustable tenure and downpayment  
✅ Mock credit approval system (simulated API)  
✅ EMI calculation and schedule generation  
✅ Repayment tracking with live updates  
✅ Dashboard with outstanding balance and due history  
✅ Local persistence via `shared_preferences` (demo)  
✅ Clean, minimal, and recruiter-friendly UI (Material 3)

---

## Project Structure

lib/
├── main.dart
├── app_theme.dart
├── models/
│ └── product.dart
├── providers/
│ ├── product_provider.dart
│ ├── loan_provider.dart
│ └── user_provider.dart
├── services/
│ ├── mock_api.dart
│ └── storage_service.dart
├── screens/
│ ├── splash_screen.dart
│ ├── home_screen.dart
│ ├── product_detail_screen.dart
│ ├── checkout_screen.dart
│ ├── approval_screen.dart
│ ├── dashboard_screen.dart
│ └── repayment_screen.dart
└── widgets/
├── product_card.dart
├── loan_summary_card.dart
└── emi_tile.dart


---

## 🛠️ Tech Stack

| Layer | Technology |
|:------|:------------|
| Frontend | Flutter (Material 3, Provider) |
| State Management | Provider |
| Data Persistence | shared_preferences |
| Mock Backend | Local Mock API (simulated latency) |
| Language | Dart |
| IDE | Visual Studio Code |

---

## EMI Formula

The EMI (Equated Monthly Installment) is calculated as:

\[
EMI = \frac{P \times r \times (1 + r)^n}{(1 + r)^n - 1}
\]

where:  
- **P** = Principal loan amount  
- **r** = Monthly interest rate  
- **n** = Tenure in months

Implemented in `lib/utils/amortization.dart`.

---

## 📱 Screenshots


<img width="1914" height="1119" alt="Screenshot 2025-11-13 152438" src="https://github.com/user-attachments/assets/5402c659-965b-489b-878e-de794319c272" />



<img width="1919" height="1125" alt="Screenshot 2025-11-13 152505" src="https://github.com/user-attachments/assets/69c053f1-2147-436a-b410-1f491450b810" />


<img width="1919" height="1106" alt="Screenshot 2025-11-13 152521" src="https://github.com/user-attachments/assets/872a58a8-a2eb-49b5-89c3-23ae5a851eb4" />


<img width="1919" height="1113" alt="Screenshot 2025-11-13 152536" src="https://github.com/user-attachments/assets/e0405295-bb00-4716-b182-d83a9403b0bd" />

---

## ⚙️ Installation & Setup

1️ Clone the repository:
```bash
git clone https://github.com/Sharanya-Vemula/credmate_flutter.git
cd credmate_flutter
```

2️ Install dependencies:
```bash
flutter pub get
```

3️ Run the app:
```bash
flutter run
```

4️ Choose your target (e.g., Chrome for web demo):
```bash
[1]: Windows (windows)
[2]: Chrome (chrome)
[3]: Edge (edge)
```







