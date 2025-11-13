# Disaster Management App (Flutter + GetX)

A lightweight disaster management app with real‑time alerts, emergency actions, AI chat guidance, and reporting.

## Features
- Home Dashboard: real‑time climate updates, risk level, alerts, map view, shortcuts.
- Alert Screen: live, color‑coded warnings (Red/High, Orange/Medium), push + voice alerts.
- Emergency Button: one‑tap Police/Fire/Ambulance/Hospital/NGO with location sharing.
- Chat Agent: AI assistant with quick replies (What to do, Report a problem, Contact team).
- Report & Instruction: incident report with image + GPS and safety instructions.

## Tech Stack
- Flutter, Dart, GetX (state, routes, DI)
- Android (Kotlin/Java, Gradle), iOS optional
- Optional: `flutter_local_notifications`, geolocation/maps, TTS


## Getting Started
1. Prerequisites
   - Flutter SDK (3.22+), Dart 3.x
   - Android Studio Narwhal 4 Feature Drop | 2025.1.4
   - Android SDK 21+
2. Install
   - `flutter pub get`
3. Run
   - `flutter run`

## Android Setup (important)
Enable core library desugaring for `flutter_local_notifications`:
- Edit `android/app/build.gradle`:
  - Set Java 17 and turn on desugaring.
  - Add desugar dependency.

