$ dart pub global activate very_good_cli

$ very_good create my_app

// very_good create my_app --desc "Krishna Vishwakarma Portfolio" --org "com.everythingstack.xyz"
// very_good --analytics false

# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart


Firebase configuration file lib\firebase_options.dart generated successfully with the following Firebase apps:

Platform  Firebase App Id
web       1:456449790411:web:4d86118743280de9f1a64e
android   1:456449790411:android:35d4735d94f52b6ff1a64e
ios       1:456449790411:ios:7be517b287bea52ff1a64e

Added google-services.json to andriod/app
Added GoogleService-Info.plist to ios/Runner

Some Null Safety Fix
// dart pub outdated --mode=null-safety
// dart pub upgrade --null-safety

AppLocalizations
// flutter gen-l10n
