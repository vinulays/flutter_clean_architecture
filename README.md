# Flutter Clean Architecture News App

A Flutter application that fetches and displays the most viewed articles from the **New York Times API**, built using **Clean Architecture**, **Flutter Bloc**, and **Dio**. URL launching is handled using the `url_launcher` package.

---

## Features

- 🔥 Clean Architecture for scalability
- 🔁 BLoC for robust state management
- 🌐 API integration with NY Times
- 🌍 URL launching with `url_launcher`
- 📦 Dependency injection via `get_it`
- 🌱 Environment config using `flutter_dotenv`

---

## Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/vinulays/flutter_clean_architecture.git
cd flutter_clean_architecture
```

### 2. Add .env file

```bash
API_URL=https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json
API_KEY=your_nytimes_api_key

```

### 3. Install dependencies

```
flutter pub get
```

### 4. Run the app

```
flutter run
```

## Screenshots

![App Screenshot](https://firebasestorage.googleapis.com/v0/b/recychamp.appspot.com/o/screenshots%2FScreenshot_1747627977.png?alt=media&token=f4f7620a-6078-4f63-bb35-fe8fc2860776)
