# Recreation Notes

How the new project was reconstructed from the reference material, what was discovered,
what was recreated, and every decision made along the way.

## 1. What the reference actually contained

Reference directory: `C:\Users\AAYUSH\Downloads\Android-main\Android-main` (read-only;
never modified). Despite the task describing `java`, `xml` and a `PPTX`, the real contents
were:

- **`nat/`** — 58 `.java` files, package `com.example.nat`
  (`MainActivity`, `Main2Activity`…`Main50Activity`, `Member`, `Member3`, `Member4`,
  `Member5`, `SingleChoice`…`SingleChoice4`).
- **`layout/`** — 46 layout XML files (`activity_main.xml`, `activity_main2…50` with gaps,
  plus `layout.xml`). **No** `values/`, `drawable/`, `menu/`, `AndroidManifest.xml`,
  Gradle files or `google-services.json` were included.
- **`presentaion.pptx`** — 55-slide project presentation with 63 embedded images
  (UML diagrams + real app screenshots).

So only **source code + layouts** were provided — the surrounding Android project
(resources, manifest, Gradle, Firebase config) had to be reconstructed.

## 2. What the PPTX told us (used to fill gaps)

- Project title **"Scoreboard with Schedule and Analysis"**, in-app brand **SportyFi**
  (teal whistle logo, yellow wordmark, dark "network" background, green buttons).
- Modules: **Scoreboard, Schedule, Analysis, Form, Admin, User**.
- Multi-sport: **Cricket, Football, Basketball** (Volleyball listed).
- Real-time scores via Firebase; offline dialog; Boys/Girls categories; tournament
  stages (Quarter/Semi/Final); team & player analysis.
- Screenshots were used as the visual reference for the recreated screens and the colour
  palette, and to extract the **real app logo**.

## 3. What was recreated (and why)

### Copied verbatim (faithful preservation)
- **All 58 Java files** → `app/src/main/java/com/example/nat/` unchanged. Business logic,
  navigation, Firebase calls, validation rules and UI wiring are byte-for-byte identical
  to the original.
- **All 46 original layouts** → `app/src/main/res/layout/` unchanged.

### Recreated because missing from the reference
| Item | Why missing | How recreated |
|------|-------------|---------------|
| `activity_main5/6/7/8/9.xml` | referenced by `Main5–9Activity` but not in `layout/` | Rebuilt with the **exact view IDs** the activities call via `findViewById`, styled to match the PPTX screenshots (admin home, add-schedule, select-sport, boys/girls, select-teams VS). |
| `res/values/colors.xml` | not provided | Palette derived from screenshots (teal `#29B6C6`, dark `#00252B`, green `#29DD7A`, yellow `#D8C410`). Includes `colorPrimaryDark`/`white` referenced by layouts. |
| `res/values/strings.xml` | not provided | `app_name=SportyFi` + the 5 validation messages referenced by `Main2Activity`. |
| `res/values/arrays.xml` | not provided | `choice/choice2` = sports, `team/team2` = teams (see §5). |
| `res/values/styles.xml` | not provided | `AppTheme` (AppCompat, teal action bar) referenced by the manifest. |
| `res/menu/menu.xml` | not provided | `logoutmenu` + `homemenu` items (IDs required by ~34 activities), with power/home icons. |
| `res/drawable/*` (27 names) | not provided | Button/input **shape** drawables, **vector** icons (user, password, down, home, logout), **gradient** backgrounds, and sport/stat vector placeholders — all matching the names the code/layouts reference. |
| `logo` + launcher icons | not provided | **Real logo extracted** from the presentation (`image16.png`), cropped to the whistle circle and resized; launcher icons generated from it for all densities. |
| `AndroidManifest.xml` | not provided | Declares all 50 activities (MainActivity = launcher), INTERNET + ACCESS_NETWORK_STATE, theme and icons. |
| Gradle project files | not provided | `settings.gradle`, root/app `build.gradle`, `gradle.properties`, wrapper (Gradle 8.14), `proguard-rules.pro`. |
| `google-services.json` | not provided | Valid **placeholder** (package `com.example.nat`) so the project configures; must be replaced with a real one. |

## 4. Dependencies discovered from the source (not obvious up front)

By scanning imports and layout tags:
- `com.google.firebase:firebase-database` — Realtime Database (40+ files).
- `com.github.sundeepk:compactcalendarview` — the schedule calendar (`Main4Activity`,
  `activity_main4.xml`).
- `com.github.thyrlian:AwesomeValidation` — sign-up validation (`Main2Activity`).
- `androidx.constraintlayout` — root of 32 layouts.
- `androidx.appcompat` — all activities extend `AppCompatActivity`.

`org.json` and `org.w3c.dom` imports are part of the Android framework (no dependency
needed). The JitPack repo was added to `settings.gradle` for the two `com.github.*` libs.

## 5. Inferred values you may want to edit

- **`arrays.xml`** — the original defining XML for `choice/choice2/team/team2` was not in
  the reference. Sports were confirmed from code/screenshots (Cricket/Football/Basketball/
  Volleyball). Team names were **not recoverable**, so placeholder college-stream names
  (BCA, BSc IT, iMSc IT, MSc IT, MCA) are used. Edit to match your real teams.
- **Validation strings** (`nameerror`, `emailerror`, `passworderror`, `mobileerror`,
  `iderror`) — reconstructed to match each AwesomeValidation regex rule.

## 6. A note on the hard-coded demo login (unchanged from original)

`MainActivity` contains a hard-coded admin shortcut (`NehaA` / `neharsha`) that routes to
the admin home — this is in the **original source** and was preserved as-is for fidelity.
It is not a secret added during recreation. All other logins are validated against the
Firebase `data` node. No API keys or credentials were invented or hard-coded.

## 7. Testing & verification performed

The authoring environment was **offline** and had **no Android emulator session**, so a
full Gradle build/APK and on-device run **could not be completed here** (honest
disclosure). What *was* verified:

- ✅ **Gradle wrapper generated and runs** (Gradle 8.14 + JDK 17 / Android Studio JBR).
- ✅ **Build configures successfully** — AGP 8.11.1, the google-services plugin, the SDK
  location and the merged manifest all load. The build proceeds to dependency resolution
  and **fails only** with *"No cached version … available for offline mode"* for the 5
  external libraries (appcompat, constraintlayout, firebase-database, compactcalendarview,
  AwesomeValidation). This is purely the lack of internet, not a project error.
- ✅ **All 85 XML files are well-formed** (parsed with no errors), including the 5
  recreated layouts and every `values/` file and the manifest.
- ✅ **Every `R.id` used in Java (93 distinct) is defined** in a layout/menu — no missing
  view IDs, including the 5 recreated layouts.
- ✅ **Every `R.layout / R.drawable / R.menu / R.array / R.string / R.color` reference
  resolves** to a provided resource (the only `R.layout.simple_*` hits are Android
  framework `android.R.layout.*`, which are correct).

### To finish verification on your machine
1. Open in Android Studio **online** and let Gradle sync download the libraries.
2. Add a real `google-services.json`.
3. Run on an emulator/device (minSdk 21). Seed a Firebase `data` user to test login.

## 8. Functionality that could not be reproduced exactly

- **Exact original image assets** (photographic sport backgrounds, player silhouettes,
  versus artwork). Replaced with close gradient/vector placeholders of the same resource
  names; swap in real PNGs to restore the pixel-exact look. The **logo is authentic**.
- **Exact team list** in `arrays.xml` (not recoverable — placeholders provided).
- Everything else — all screens, navigation, business logic, Firebase structure,
  validation rules, menus and the login/offline behaviour — is preserved from the
  original source unchanged.
