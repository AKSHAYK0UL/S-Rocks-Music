# S.Rocks.Music 🎶

## State Management Approach: BLoC

This project uses **BLoC** for state management, adhering to the MVVM architecture pattern. The structure is layered as follows:

- **Network Layer**: Handles Firebase data source communications.
- **Repository Layer**: Abstracts network logic and provides a clean API to the app.
- **Model Layer**: Defines the structure of each music service (title, description, background image, leading image).
- **BLoC Layer**: Manages business logic and state transitions (loading, success, error).
- **Presentation Layer**: Contains UI components, organized into screens and widgets.

---

## 🔧 Setup and Installation

1. **Install Flutter**  
   Follow the [official guide](https://flutter.dev/docs/get-started/install) to install Flutter.

2. **Clone the Repository**
   ```bash
   git clone https://github.com/AKSHAYK0UL/S-Rocks-Music.git
   ```

3. **Navigate to the Project Directory**
   ```bash
   cd s_rocks_music
   ```

4. **Install Dependencies**
   ```bash
   flutter pub get
   ```

5. **Run the App**
   ```bash
   flutter run
   ```

---

## 🔥 Firebase Setup

This project uses Firebase Firestore to fetch dynamic service card data. Configure Firebase using FlutterFire CLI:

1. **Login to Firebase**
   ```bash
   firebase login
   ```

2. **Activate FlutterFire CLI**
   ```bash
   dart pub global activate flutterfire_cli
   ```

3. **Configure Firebase**
   ```bash
   flutterfire configure
   ```
   This generates a `firebase_options.dart` file.

4. **Add Firebase Packages**
   ```bash
   flutter pub add firebase_core
   flutter pub add cloud_firestore
   ```

5. **Initialize Firebase in `main.dart`**
   ```dart
   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,
     );
     FirebaseFirestore.instance.settings = const Settings(
       persistenceEnabled: true,
     );
     runApp(MyApp());
   }
   ```

6. **Create Firestore Data**  
   In the Firebase Console, add a collection named `tiledata` with this structure:

   ```
   tiledata (collection)
   └── autoID (document)
       ├── title: "Music Production"
       ├── description: "Custom instrumentals & film scoring"
       ├── background image: "https://background_image.png"
       └── leading image: "https://leading_image.png"
   ```

---

## 📁 Project Structure

```
lib/
├── bloc/                         # BLoC classes (events, states, blocs)
│   ├── database_bloc.dart
│   ├── database_event.dart
│   └── database_state.dart
│
├── model/                        # Data models
│   └── tiledatamodel.dart
│
├── network/                      # Firebase or API handling
│   └── networkdb.dart
│
├── repository/                   # Abstracts data source (calls network layer)
│   └── repodb.dart
│
├── presentation/                 # UI Layer
│   ├── screen/
│   │   ├── home.dart
│   │   ├── navbar.dart
│   │   ├── othertabs.dart
│   │   └── tilescreen.dart
│   └── widgets/
│       ├── optiontile.dart
│       └── searchbar.dart
│
└── main.dart                     # Entry point
```

---

## ✨ Features

- 🎵 Clean and responsive UI based on Figma design
- 🔥 Firebase Firestore integration for dynamic card content
- 🧠 MVVM structure with BLoC state management
- 🧭 Seamless navigation to detail screen on card tap

---

## 👨‍💻 Author

Made with ❤️ by **Akshay Koul**  
*Flutter Mini Project Assignment – 2025*
