# Teal Login Screen with Sign Up Toggle in Flutter 💚

A sleek **dark teal login screen** built with Flutter, featuring a soft green glow at the top, a **Login / Sign Up** segmented toggle with a sliding highlight, rounded pill fields and a bright mint **Log Me In** button, all in the clean Inter font.

The UI is split into small, reusable components, the same way you would structure a React Native app.

## 🚀 Demo & Project

🌐 **Live Preview:**  
https://yaqoobdeveloper.github.io/Teal-Login-Screen-with-Sign-Up-Toggle-in-Flutter/

💻 **GitHub Repository:**  
https://github.com/YaqoobDeveloper/Teal-Login-Screen-with-Sign-Up-Toggle-in-Flutter

▶️ **Video Demo:**  
https://youtube.com/shorts/OJdOD5m6xxk

## 📸 Preview

<img width="858" height="900" alt="Image" src="https://github.com/user-attachments/assets/47200a13-5d86-4091-a681-1dcf1925f7ad" />

## ✨ Features

- 💚 Dark teal theme with a smooth green glow at the top
- 🔀 **Login / Sign Up** toggle with a sliding highlight
- 👤 Sign Up mode adds a **Full Name** field and switches the button to **Sign Me Up**
- 💊 Rounded pill fields with leading icons
- 👁️ Eye button to show or hide the password
- ✅ Validation for name, email and password
- ⌨️ Press Enter on the password field to submit
- 🧩 Reusable components with a barrel export (like `components/index.ts`)

## 📁 Project Structure

```
lib/
├── main.dart
├── app.dart
├── screens/welcome_back_login_screen.dart
├── components/welcome/
│   ├── welcome_components.dart   # barrel export
│   ├── top_glow.dart
│   ├── segmented_toggle.dart
│   ├── pill_field.dart
│   ├── pill_password_field.dart
│   └── mint_button.dart
├── theme/welcome_colors.dart
└── utils/validators.dart
```

## 🛠️ Built With

- **Flutter 3.47.2**
- **Dart**
- [google_fonts](https://pub.dev/packages/google_fonts) (Inter)

## 📋 Requirements

- Flutter **3.47.2** or compatible version
- Dart SDK included with Flutter
- Android Studio or VS Code
- Xcode for iOS development

## ▶️ Run

### 1. Clone the repository

```bash
git clone https://github.com/YaqoobDeveloper/Teal-Login-Screen-with-Sign-Up-Toggle-in-Flutter.git
```

### 2. Navigate to the project

```bash
cd Teal-Login-Screen-with-Sign-Up-Toggle-in-Flutter
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the app

```bash
flutter run
```

## 👨‍💻 Created By

### Yaqoob Developer

**Flutter Developer & YouTuber**

▶️ **YouTube:**  
https://youtube.com/@yaqoob_developer

🌐 **Website:**  
https://yaqoobdeveloper.com/

⭐ If you find this project useful, consider giving the repository a **star**!
