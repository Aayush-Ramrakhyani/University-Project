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
> By Neha Aswani, Trusha Bhavsar, and **Aayush Ramrakhyani** · Mentor: *Prof. Ankita Kanojiya.*

---

## 💡 The Story Behind SportyFi

From **August 2019 to February 2020**, as third-year students, we built this with none of
today's AI tools to lean on. We had to pick up a **completely new language and the whole
Android + Firebase stack on our own** — learning from docs, forums, and a lot of trial and
error.

We set out to build something real for our **University**: a live sports scoreboard with
scheduling and analysis. Over those seven months we slowly figured out real-time databases,
multi-screen navigation, and live scoring for cricket, football and basketball — and by
early 2020 we were close enough that we seriously considered **publishing it on the Google
Play Store**.

Then the **COVID-19 lockdown hit**, right as we were wrapping up. With campus closed we had
**no faculty support or guidance** on the last mile — how to actually publish an app, what
security and safety measures to put in place, data and privacy considerations, none of it.
That, together with the limits of our **free-tier Firebase**, meant SportyFi never made it
to the Play Store.

But that was never the real win. The real win was three students proving to ourselves that
we could **teach ourselves a new technology from scratch and ship a working app** — a
lesson that has stuck with us ever since.

> This repository is a faithful recreation of that original 2019–2020 project, rebuilt as a
> clean, buildable Android Studio project so the work isn't lost.

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

### 🔐 Onboarding & Authentication
<p>
  <img src="screenshots/01_no_internet.jpeg" width="190" title="No internet dialog"/>
  <img src="screenshots/02_login.jpeg" width="190" title="Login"/>
  <img src="screenshots/03_login_validation.jpeg" width="190" title="Login validation"/>
</p>

### 🏠 Home
<p>
  <img src="screenshots/04_admin_home.jpeg" width="190" title="Admin home"/>
  <img src="screenshots/05_user_home.jpeg" width="190" title="User home"/>
</p>

### 📅 Admin — Schedule a Match
<p>
  <img src="screenshots/06_admin_schedule_date.jpeg" width="190" title="Pick date"/>
  <img src="screenshots/07_admin_schedule_time.jpeg" width="190" title="Pick time"/>
  <img src="screenshots/08_admin_schedule_calendar.jpeg" width="190" title="Calendar"/>
  <img src="screenshots/09_admin_schedule_specs_1.jpeg" width="190" title="Match specs"/>
</p>
<p>
  <img src="screenshots/10_admin_schedule_specs_2.jpeg" width="190" title="Match specs"/>
  <img src="screenshots/11_admin_select_sport.jpeg" width="190" title="Select sport"/>
  <img src="screenshots/12_admin_select_teams.jpeg" width="190" title="Select teams (VS)"/>
</p>

### 🗓️ User — Schedule
<p>
  <img src="screenshots/13_user_schedule_1.jpeg" width="190" title="User schedule"/>
  <img src="screenshots/14_user_schedule_2.jpeg" width="190" title="User schedule day view"/>
</p>

### ⚽🏀 Admin — Scoreboard (Football / Basketball)
<p>
  <img src="screenshots/15_scoreboard_select_sport.jpeg" width="190" title="Select sport"/>
  <img src="screenshots/16_football_events_list.jpeg" width="190" title="Events list"/>
  <img src="screenshots/17_football_teams.jpeg" width="190" title="Team names"/>
  <img src="screenshots/18_football_select_players.jpeg" width="190" title="Select players"/>
</p>
<p>
  <img src="screenshots/19_football_scoreboard.jpeg" width="190" title="Football scoreboard"/>
  <img src="screenshots/20_football_scoring_1.jpeg" width="190" title="Add score / timer"/>
  <img src="screenshots/21_football_scoring_2.jpeg" width="190" title="Select scorer"/>
</p>

### 🏏 Admin — Scoreboard (Cricket)
<p>
  <img src="screenshots/22_cricket_scoreboard_intro_1.jpeg" width="190" title="Cricket scoreboard"/>
  <img src="screenshots/23_cricket_scoreboard_intro_2.jpeg" width="190" title="Cricket scoreboard"/>
  <img src="screenshots/24_cricket_select_players.jpeg" width="190" title="Select players"/>
  <img src="screenshots/25_cricket_toss.jpeg" width="190" title="Toss winner"/>
</p>
<p>
  <img src="screenshots/26_cricket_bat_bowl_choice.jpeg" width="190" title="Bat or bowl"/>
  <img src="screenshots/27_cricket_select_positions.jpeg" width="190" title="Striker / non-striker / bowler"/>
  <img src="screenshots/28_cricket_scoreboard.jpeg" width="190" title="Cricket scoreboard"/>
  <img src="screenshots/29_cricket_new_bowler_batsman.jpeg" width="190" title="New bowler / batsman"/>
</p>

### 📡 User — Live Scores
<p>
  <img src="screenshots/30_user_football_event.jpeg" width="190" title="Choose event"/>
  <img src="screenshots/31_user_football_live.jpeg" width="190" title="Football live"/>
  <img src="screenshots/32_user_cricket_live_1.jpeg" width="190" title="Cricket live"/>
  <img src="screenshots/33_user_cricket_live_2.jpeg" width="190" title="Cricket live"/>
</p>

### 📊 Analysis — Football
<p>
  <img src="screenshots/34_analysis_home.jpeg" width="190" title="Analysis home"/>
  <img src="screenshots/35_analysis_team_player_menu.jpeg" width="190" title="Team / player menu"/>
  <img src="screenshots/36_football_team_analysis_menu.jpeg" width="190" title="Football team analysis"/>
</p>
<p>
  <img src="screenshots/37_football_team_goals.jpeg" width="190" title="Most goals (team)"/>
  <img src="screenshots/38_football_team_wins.jpeg" width="190" title="Most wins (team)"/>
  <img src="screenshots/39_football_player_goals.jpeg" width="190" title="Most goals (player)"/>
</p>

### 📈 Analysis — Cricket
<p>
  <img src="screenshots/40_cricket_team_analysis_menu.jpeg" width="190" title="Cricket team analysis"/>
  <img src="screenshots/41_cricket_team_wickets.jpeg" width="190" title="Most wickets (team)"/>
  <img src="screenshots/42_cricket_team_runs.jpeg" width="190" title="Most runs (team)"/>
  <img src="screenshots/43_cricket_team_wins.jpeg" width="190" title="Most wins (team)"/>
</p>
<p>
  <img src="screenshots/44_cricket_player_analysis_menu.jpeg" width="190" title="Cricket player analysis"/>
  <img src="screenshots/45_cricket_player_wickets.jpeg" width="190" title="Most wickets (player)"/>
  <img src="screenshots/46_cricket_player_runs.jpeg" width="190" title="Most runs (player)"/>
</p>

---

## 📝 License

This project was created for academic purposes. Feel free to use it for learning.

<div align="center">
Made with 🏏⚽🏀 for college sports
</div>
