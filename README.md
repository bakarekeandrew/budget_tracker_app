# 💰 Smart Expenses Tracker

A modern, beautiful Flutter application for tracking personal expenses with an elegant purple-to-pink gradient design.

![Smart Expenses Tracker](https://img.shields.io/badge/Flutter-3.0+-blue?style=for-the-badge&logo=flutter)
![Platform](https://img.shields.io/badge/Platform-Mobile%20%7C%20Desktop-green?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

## ✨ Features

###  Modern UI Design
- **Beautiful gradient themes** - Purple to pink color palette
- **Material Design 3** inspired components
- **Dark/Light mode** support with smooth transitions
- **Rounded corners** and subtle shadows throughout
- **Responsive design** for mobile and desktop

###  Expense Management
- **Category-based organization** with custom icons
- **Real-time expense tracking** with local SQLite database
- **Add, edit, and delete** expenses with intuitive forms
- **Date picker** for accurate expense logging
- **Currency formatting** with proper localization

###  User Experience
- **Swipe to delete** expenses with confirmation dialogs
- **Search functionality** across all expenses
- **Visual charts** and analytics for spending patterns
- **Total expense overview** with entry counts
- **Smooth animations** and transitions

###  Expense Categories
-  **Auto And Transport** - Vehicle and travel expenses
-  **Sports** - Fitness and recreational activities
-  **Food And Drinks** - Dining and beverage costs
-  **Entertainment** - Movies, games, and leisure
-  **Education** - Learning and development expenses
-  **Other** - Miscellaneous spending

##  Getting Started

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/smart-expenses-tracker.git
   cd smart-expenses-tracker
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Platform Support
-  **Android** - Full support
-  **iOS** - Full support  
-  **Windows** - Full support
-  **macOS** - Full support
-  **Linux** - Full support

## 🛠️ Tech Stack

- **Framework**: Flutter 3.0+
- **Language**: Dart
- **Database**: SQLite (sqflite)
- **State Management**: Provider
- **UI Components**: Material Design 3
- **Icons**: Flutter Material Icons
- **Date Formatting**: intl package

## 📱 Screenshots

### Main Dashboard
- Modern gradient header with app branding
- Total expenses overview card
- Category-based expense organization
- Quick navigation to all expenses

### Expense Management
- Beautiful form design with gradient accents
- Intuitive date and category selection
- Real-time validation and feedback
- Smooth modal bottom sheets

### Category Views
- Unique gradient colors for each category
- Expense count and total amount display
- Swipe gestures for quick actions
- Modern card-based layout

##  Key Features

### Smart Categorization
Automatically organize expenses into predefined categories with custom icons and color schemes.

### Real-time Analytics
Track your spending patterns with visual representations and detailed breakdowns.

### Cross-platform Support
Seamlessly sync your expenses across all your devices with local database storage.

### Modern Design Language
Experience a beautiful, intuitive interface designed with modern UI/UX principles.

##  Configuration

### Theme Customization
The app uses a centralized theme provider that can be easily customized:

```dart
// Customize colors in lib/models/theme_provider.dart
static const Color primaryPurple = Color(0xFF6366F1);
static const Color primaryPink = Color(0xFFEC4899);
```

### Database Configuration
The app uses SQLite for local storage with automatic initialization for desktop platforms.

##  Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
  sqflite: ^2.0.0
  sqflite_common_ffi: ^2.0.0
  intl: ^0.18.0
```


