# SportyFi — Scoreboard with Schedule and Analysis

A faithful recreation of the original Android college project **"Scoreboard with Schedule
and Analysis"** (in-app name **SportyFi**), rebuilt as a complete, independent, Android
Studio–ready project.

> Original academic project — GLS University, FCAIT, iMSc(IT), Ahmedabad.
> By **Neha Aswani (IM17A2)**, **Trusha Bhavsar (IM17A3)**, **Aayush Ramrakhyani (IM17A44)**.
> Mentor: Prof. Ankita Kanojiya.

---

## 1. Original Project Overview

SportyFi is a **multi-sport, real-time scoreboard application for schools and colleges**.
It lets a sports **admin** schedule matches and enter live scores, while **users** follow
live scores and view team/player analysis. It supports **Cricket, Football and Basketball**
(Volleyball is also listed as a sport). Data is stored and synced live through
**Firebase Realtime Database**.

The project is built the way it was originally written: a large set of `Activity`
screens (one per step of each flow) in a single package, communicating through
`Intent` extras and shared Firebase nodes.

## 2. Features and Functionality

- **Login** — registered admin/user login, validated against Firebase (`data` node).
  A hard-coded admin account routes to the admin home; other valid users route to the
  user home. Shows a *"No Internet Connection"* dialog when offline.
- **Sign-up** — new-user registration form with live field validation
  (name, email, password, mobile, login ID) using the AwesomeValidation library.
- **Admin — Schedule** — pick a date (calendar) and time (clock), choose the sport,
  category (Boys/Girls) and the two teams, then save the fixture (`data2` node).
- **Admin — Scoreboard** — choose sport → choose fixture → pick players/toss (cricket)
  or start timer (football/basketball) → enter live scores. Cricket supports
  striker/non-striker/bowler selection and new batsman/bowler prompts on wicket/over.
- **User — Schedule** — calendar view of fixtures; tapping a day shows that day's
  matches (or "No event" when empty).
- **User — Scoreboard** — live scores per sport, read in real time from Firebase.
- **Analysis** — team and player analytics per sport (most runs/wickets/goals,
  most matches won), computed from the stored match/score data.

## 3. Technologies and Libraries Used

| Area | Technology |
|------|-----------|
| Language | **Java** (as in the original — not migrated to Kotlin) |
| UI | **XML layouts** (ConstraintLayout / RelativeLayout / LinearLayout) — not Compose |
| Backend | **Firebase Realtime Database** |
| Calendar | **CompactCalendarView** (`com.github.sundeepk:compactcalendarview`) |
| Validation | **AwesomeValidation** (`com.github.thyrlian:AwesomeValidation`) |
| Support libs | AndroidX AppCompat, ConstraintLayout |
| Build | Android Gradle Plugin 8.11.1, Gradle 8.14, google-services 4.4.2 |

## 4. New Project Structure

```
Android_Recreated_Project/
├── build.gradle                 # root, plugin versions
├── settings.gradle              # repos (google, mavenCentral, jitpack), module include
├── gradle.properties            # AndroidX + nonTransitiveRClass=false
├── local.properties             # SDK path (machine-specific, not committed)
├── gradlew / gradlew.bat        # Gradle wrapper (8.14)
├── gradle/wrapper/…
└── app/
    ├── build.gradle             # SDK levels, dependencies
    ├── google-services.json     # PLACEHOLDER — replace with your own (see §12)
    ├── proguard-rules.pro
    └── src/main/
        ├── AndroidManifest.xml  # 50 activities + INTERNET / ACCESS_NETWORK_STATE
        ├── java/com/example/nat/   # 58 .java files
        └── res/
            ├── layout/   # 51 layouts (46 original + 5 recreated)
            ├── drawable/ # shapes, icons, gradient backgrounds, logo
            ├── mipmap-*/ # launcher icons (generated from the real logo)
            ├── menu/menu.xml       # Logout + Home action-bar items
            └── values/   # colors, strings, styles, arrays
```

## 5. Important Classes

- **`MainActivity`** — login screen; Firebase check, admin vs user routing, offline dialog.
- **`Main2Activity`** — sign-up form with AwesomeValidation; writes new user to `data`.
- **`Main3Activity`** — user home (Score Board / Schedule / Analysis).
- **`Main7Activity`** — admin home (Score Board / Schedule).
- **`Main4Activity`** — user schedule screen using CompactCalendarView.
- **`Main5/6/8/9Activity`** — admin schedule flow (date/time → sport → category → teams).
- **`Main48Activity` / `Main19`, `Main31`, `Main42/43`** — the live-scoring / scoreboard
  engines (largest classes; cricket & football/basketball scoring and real-time sync).
- **Models** — `Member` (participant profile), `Member3` (fixture/schedule),
  `Member4` (team & match stats), `Member5` (player stats). These are the POJOs
  (de)serialized by Firebase.
- **Dialog fragments** — `SingleChoice`, `SingleChoice2` (choose sport),
  `SingleChoice3`, `SingleChoice4` (choose team) — single-choice `AlertDialog`s backed
  by the `choice/choice2/team/team2` string-arrays.

> The screens are named `MainActivity` + `Main2Activity … Main50Activity`, matching the
> original source exactly. They are wired together by `Intent` navigation and shared
> Firebase nodes rather than a navigation graph.

## 6. Database Architecture (Firebase Realtime Database)

All data lives under the database root in these nodes (discovered from the code):

| Node | Purpose |
|------|---------|
| `data` | Registered users (Login_Id, Password, profile) |
| `data2` | Scheduled fixtures (`Member3`: day, time, match, team, team1) |
| `data3` | Schedule/analysis support data |
| `data4`, `data5`, `data6` | Live scoreboards / match state per sport |
| `player` | Per-player records (used heavily in scoring & analysis) |
| `won`, `loss`, `score`, `wicket`, `run`, `over`, `ball`, `goal`, … | Stat fields |

There is **no SQL/Room database** — persistence is entirely Firebase Realtime Database.

## 7. API / External Integrations

- **Firebase Realtime Database** — the only external service. Configured via
  `app/google-services.json` and the `com.google.gms.google-services` Gradle plugin.

## 8. Required Permissions

Declared in `AndroidManifest.xml`:

- `android.permission.INTERNET` — Firebase sync.
- `android.permission.ACCESS_NETWORK_STATE` — the login screen's connectivity check.

## 9. Dependency List

```gradle
implementation 'androidx.appcompat:appcompat:1.6.1'
implementation 'androidx.constraintlayout:constraintlayout:2.1.4'
implementation platform('com.google.firebase:firebase-bom:33.1.2')
implementation 'com.google.firebase:firebase-database'
implementation 'com.github.sundeepk:compactcalendarview:3.0.0'
implementation 'com.github.thyrlian:AwesomeValidation:4.3'
// plugin: com.google.gms:google-services:4.4.2
```

`settings.gradle` enables the JitPack repository, required by CompactCalendarView and
AwesomeValidation.

## 10. How to Open and Run

1. Open **Android Studio** → *Open* → select `Android_Recreated_Project`.
2. Android Studio will create/refresh `local.properties` with your SDK path.
3. Let **Gradle sync** run. **An internet connection is required on first sync** so Gradle
   can download the libraries above (they are not bundled).
4. Replace `app/google-services.json` with the file from your own Firebase project
   (see §12). Then **Run ▶** on an emulator or device (minSdk 21).

## 11. How to Build an APK

- **Android Studio:** *Build ▸ Build Bundle(s) / APK(s) ▸ Build APK(s)*.
- **Command line (Windows):**
  ```
  gradlew.bat assembleDebug
  ```
  Output: `app/build/outputs/apk/debug/app-debug.apk`.

## 12. Firebase / Credentials Configuration (IMPORTANT)

The committed `app/google-services.json` is a **structurally valid placeholder** — it lets
the project open and configure, but it does **not** connect to any real database. To make
login, scheduling, scoring and analysis work against live data:

1. Create a Firebase project at <https://console.firebase.google.com>.
2. Add an **Android app** with package name **`com.example.nat`**.
3. Enable **Realtime Database** (test mode is fine for a college demo).
4. Download the generated **`google-services.json`** and replace the placeholder in `app/`.
5. (Optional) Seed the `data` node with a user, e.g.
   `{ "Login_Id": "user1", "Password": "pass123" }`, to test login.

No secrets are hard-coded in the source. See `RECREATION_NOTES.md` for the hard-coded
demo admin login that exists in the original source.

## 13. Known Limitations / Differences from the Original

- **5 layouts were recreated** (`activity_main5/6/7/8/9.xml`) because they were missing
  from the supplied reference. They reproduce the original view IDs and the design shown
  in the presentation screenshots. See `RECREATION_NOTES.md`.
- **Image assets are placeholders.** The original photographic backgrounds and sport
  icons were not in the reference, so they are reproduced as gradient/shape/vector
  drawables that approximate the originals. The **app logo is the real one**, extracted
  from the presentation. Drop real images into `res/drawable/` (same names) to restore
  the exact look.
- **String-arrays** (`choice/choice2/team/team2`) and **sign-up validation strings** were
  not in the reference and have been reconstructed; edit `res/values/arrays.xml` and
  `strings.xml` to match your tournament.
- A full Gradle build/APK was **not produced in the authoring environment** (it was
  offline — the libraries above could not be downloaded). The project is verified
  structurally (see `RECREATION_NOTES.md` §Testing); it builds once dependencies are
  available online.
