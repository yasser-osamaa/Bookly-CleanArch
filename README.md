# 📚 Bookio App

A modern Flutter bookstore application built to practice and demonstrate **Clean Architecture**, **Cubit/BLoC**, **REST API integration**, **pagination**, and scalable Flutter project structure.

The app allows users to browse books, view book details, search for books, and load more books dynamically while scrolling.

## ✨ Features

* 📖 Browse featured books
* 🔥 Browse newest books
* 🔍 Search for books
* 📄 Book details screen
* ♾️ Pagination / infinite scrolling
* 🌐 Google Books API integration
* ⚡ State management using Cubit
* 🏗️ Clean Architecture
* 🧭 Navigation using GoRouter
* 🖼️ Cached book images
* 🎨 Responsive UI
* 🔄 Loading and error states
* ✨ Smooth page transitions

## 🛠️ Technologies & Packages

* **Flutter / Dart**
* **Clean Architecture**
* **Cubit / flutter_bloc**
* **Dio** – API requests
* **GoRouter** – Navigation
* **GetIt** – Dependency Injection
* **Dartz** – Functional error handling
* **Cached Network Image** – Image caching
* **Google Books API**

## 🏗️ Architecture

The project follows **Clean Architecture** and is separated into different layers:

```text
lib/
├── core/
│   ├── errors/
│   ├── utils/
│   ├── widgets/
│   └── ...
│
├── features/
│   └── home/
│       ├── data/
│       │   ├── data_sources/
│       │   ├── models/
│       │   └── repositories/
│       │
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── use_cases/
│       │
│       └── presentation/
│           ├── manager/
│           ├── views/
│           └── widgets/
│
└── main.dart
```

### Architecture Flow

```text
Presentation
     ↓
   Cubit
     ↓
 Use Case
     ↓
 Repository
     ↓
 Data Source
     ↓
 Google Books API
```

This structure keeps the business logic independent from the UI and makes the application easier to maintain and extend.

## 📱 Screens

### Home

The home screen displays:

* Featured books
* Newest books
* Book covers
* Loading indicators
* Pagination while scrolling

### Book Details

Displays information about the selected book, such as:

* Book cover
* Title
* Author
* Rating
* Price
* Description
* Additional book information

### Search

Users can search for books by name.

Search results are loaded dynamically and support pagination as the user scrolls.

## ♾️ Pagination

The app implements pagination for large book lists.

Instead of loading all books at once, the application requests books page by page from the API.

The next page is requested when the user approaches the end of the list.

This helps reduce unnecessary network requests and improves the user experience.

## 🌐 API

The application uses the **Google Books API** to retrieve book information.

Example endpoint:

```text
https://www.googleapis.com/books/v1/volumes
```

The API is used to retrieve:

* Book titles
* Authors
* Images
* Descriptions
* Ratings
* Prices
* Other book information

## 🧩 State Management

The application uses **Cubit** from `flutter_bloc`.

Different states are handled for:

* Initial loading
* Successful requests
* Pagination loading
* Request failures
* Pagination failures

This keeps UI state management separate from the application's business logic.

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone <your-repository-url>
```

### 2. Navigate to the project

```bash
cd bookly
```

### 3. Install dependencie
