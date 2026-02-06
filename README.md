# architecturemaster

A **Flutter Clean Architecture starter** that supports **multiple state managements**
(GetX, Bloc, Cubit, Riverpod) **without changing domain & data layers**.

This project is designed as a **learning reference**, **internal framework**, and
**production-ready architecture baseline** for medium to large Flutter applications.

---

## ✨ Goals

- Clean Architecture (Domain, Data, Presentation)
- Feature-first folder structure
- Easily switch state management **per feature**
- No business logic inside UI
- Scalable for large teams & long-term projects

---

## 🧠 Core Principles

- **Domain & Data layers are state-management agnostic**
- **Each feature is isolated**
- **State management lives only in Presentation layer**
- **Reusable UI widgets are separated from logic**
- **One feature can have multiple state management implementations**

---

## 📁 Project Structure

```txt
lib/
├── app/
├── ├──core/
├── │   ├── di/
├── │   │   └── service_locator.dart
├── │   ├── error/
├── │   ├── result/
├── │   ├── usecase/
├── │   └── permission/
├── ├──routes/
├── │   └── app_router.dart
├── ├── app.dart
├── ├── bootstrap.dart
│
├── features/
│   └── feature_first/
│       ├── data/
│       │   ├── datasource/
│       │   ├── model/
│       │   └── repository/
│       │
│       ├── domain/
│       │   ├── entity/
│       │   ├── repository/
│       │   └── usecase/
│       │
│       └── presentation/
│           ├── getx/
│           ├── bloc/
│           ├── cubit/
│           ├── riverpod/
│           ├── pages/
│           └── widgets/
│
└── main.dart
```
