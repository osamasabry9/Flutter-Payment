# Payment App : ( Clean architecture with MVVM ).

This project is powered by FLutter and dart.

The main packages used in the project:

```yaml
dependencies:
  cupertino_icons: ^1.0.2
  dio: ^5.0.1
  flutter_bloc: ^8.1.2
  equatable: ^2.0.5
  webview_flutter: ^4.0.6
  get_it: ^7.2.0
```

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/osamasabry9/Flutter-Payment.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

### Folder Structure

Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
    |- app/
    |- core/
    |- features/
    |- main
```

Here is the folder structure we have been using in this project

```
lib/app/
       |- app/
       |- di/
lib/core/
       |- network/
       |- usecase/
       |- utils/

lib/features/payment/
       |- data/
       |- domain/
       |- presentation/

data/
       |- data_source/
       |- model/
       |- repository/
domain/
       |- entities/
       |- repository/
       |- usecase/
presentation/
        |- cubit/
        |- pages/
        |- widgets/

```
