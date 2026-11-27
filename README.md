<div align="center">

# 🏆 SportyFi — Scoreboard with Schedule & Analysis

**A multi-sport, real-time scoreboard app for schools & colleges — built with Android (Java) & Firebase.**

![Platform](https://img.shields.io/badge/Platform-Android-3DDC84?logo=android&logoColor=white)
![Language](https://img.shields.io/badge/Language-Java-007396?logo=java&logoColor=white)
![Backend](https://img.shields.io/badge/Backend-Firebase-FFCA28?logo=firebase&logoColor=black)
![UI](https://img.shields.io/badge/UI-XML%20Layouts-29B6C6)
![minSdk](https://img.shields.io/badge/minSdk-21-blue)

</div>

---

## 📖 About

**SportyFi** lets a sports **admin** schedule matches and enter **live scores**, while
**users** follow those scores in real time and view **team & player analysis**. It supports
**Cricket, Football and Basketball**, with all data synced through **Firebase Realtime
Database**.

> Originally an academic project — *GLS University, FCAIT, iMSc(IT), Ahmedabad.*
> By **Neha Aswani**, **Trusha Bhavsar**, and **Aayush Ramrakhyani** · Mentor: *Prof. Ankita Kanojiya.*

---

## ✨ Features

- 🔐 **Login / Sign-up** — Firebase-backed auth with live form validation; separate **admin** and **user** flows.
- 📶 **Offline detection** — shows a "No Internet Connection" dialog when the device is offline.
- 📅 **Schedule** — admin picks date (calendar) + time (clock), sport, category (Boys/Girls) and teams; users browse fixtures by day.
- 🟢 **Live Scoreboard** — real-time scoring for:
  - **Cricket** — toss, striker/non-striker/bowler selection, runs/wickets/overs, new batsman & bowler prompts.
  - **Football / Basketball** — timer-gated scoring, goal/basket scorer selection.
- 📊 **Analysis** — team & player analytics (most runs/wickets/goals, most matches won) per sport.

---

## 🛠️ Tech Stack

| Area | Technology |
|------|-----------|
| Language | Java |
| UI | XML Layouts (ConstraintLayout / RelativeLayout) |
| Backend | Firebase Realtime Database |
| Calendar | [CompactCalendarView](https://github.com/SundeepK/CompactCalendarView) |
| Validation | [AwesomeValidation](https://github.com/thyrlian/AwesomeValidation) |
| Build | Gradle 8.14 · Android Gradle Plugin 8.11.1 |

---

## 🚀 Getting Started

### Prerequisites
- Android Studio (latest) with Android SDK (API 34+)
- A Firebase project (free tier)

### 1. Clone
```bash
git clone https://github.com/Aayush-Ramrakhyani/Android.git
```

### 2. Set up Firebase
1. Create a project at the [Firebase Console](https://console.firebase.google.com).
2. Add an **Android app** with package name **`com.example.nat`**.
3. Enable **Realtime Database** (Test mode is fine for a demo).
4. Download **`google-services.json`** and place it in the **`app/`** folder.

> ⚠️ `google-services.json` is intentionally **git-ignored** — each developer adds their own.

### 3. Seed a login user
In Realtime Database, add under the **`data`** node:
```json
{ "data": { "user1": { "Login_Id": "user1", "Password": "pass123" } } }
```

### 4. Run
Open in Android Studio → let Gradle sync (needs internet on first sync) → **Run ▶** on an emulator/device.

---

## 🗄️ Database Structure (Firebase Realtime Database)

| Node | Purpose |
|------|---------|
| `data` | Registered users (Login_Id, Password, profile) |
| `data2` | Scheduled fixtures (date, time, teams) |
| `data3`–`data6` | Schedule support & live scoreboards per sport |
| `player` | Per-player records (scoring & analysis) |

---

## 📂 Project Structure

```
app/src/main/
├── java/com/example/nat/   # 58 classes: Activities, models, dialog fragments
├── res/layout/             # 51 screen layouts
├── res/drawable/           # shapes, icons, backgrounds, logo
├── res/values/             # colors, strings, styles, arrays
└── AndroidManifest.xml     # 50 activities + permissions
```

See [`PROJECT_DOCUMENTATION.md`](PROJECT_DOCUMENTATION.md) for full technical docs and
[`RECREATION_NOTES.md`](RECREATION_NOTES.md) for build/reconstruction notes.

---

## 📸 Screenshots

> _Add screenshots here — e.g. create a `screenshots/` folder and reference them:_
>
> `![Login](screenshots/login.png)` · `![Home](screenshots/home.png)` · `![Scoreboard](screenshots/scoreboard.png)`

---

## 📝 License

This project was created for academic purposes. Feel free to use it for learning.

<div align="center">
Made with 🏏⚽🏀 for college sports
</div>
