# VaccinationApp
VaccinationApp

## Steps

Step 1: Create a Firebase Project.
    - Navigate to https://firebase.google.com/
    - Click on Get started.
    - Create a new project by tapping on the Add project box.
    - Enter the Project name
    - Tap on Create project. Following this, Firebase will set up a new project for you. This will take just a minute.

Step 2: Configure your app to use Firebase
    1. Configure an Android app.
        - In the Add an app to get started section, click on Android Icon to add an Android app to Firebase.
        - On the next screen, enter your Android package name, App nickname & Debug signing certificate SHA-1 and click on Register App. Your package name is generally the applicationId in your app-level build.gradle file.
            Note : applicationId can be changed at android/app/build.gradle
        - Download the google-services.json file & place it in your project’s app root directory.
            path : android/app/google-services.json
        - Run flutter packages get
        - App is ready to build on android devices.
    
    2. Configure an iOS app
    - In the Add an app to get started section, click on iOS Icon to add an iOS app to Firebase.
    - On the next screen, enter your iOS bundle ID & App nickname and click on Register App. You can find your Bundle Identifier in the General tab for your app’s primary target in Xcode.
    - Download the GoogleService-Info.plist file & move the GoogleService-Info.plist file you just downloaded into the root of your Xcode project and add it to all targets.
            path : ios/Runner/GoogleService-Info.plist
    -  Run flutter packages get
    -  App is ready to build on iOS devices.

Step 3: Configure your app for Google Sign In.
    1. iOS integration
        - Open GoogleService-Info.plist from [my_project]/ios/Runner directory of your project.
        - Copy REVERSED_CLIENT_ID key from GoogleService-Info.plist.
        - Paste the key into the [my_project]/ios/Runner/Info.plist file.
        ```sh
            <!-- Google Sign-in Section -->
            <key>CFBundleURLTypes</key>
            <array>
                <dict>
                    <key>CFBundleTypeRole</key>
                    <string>Editor</string>
                    <key>CFBundleURLSchemes</key>
                    <array>
                        <!-- TODO Replace this value: -->
                        <!-- Copied from GoogleService-Info.plist key REVERSED_CLIENT_ID -->
                        <string>com.googleusercontent.apps.861823949799-vc35cprkp249096uujjn0vvnmcvjppkn</string>
                    </array>
                </dict>
            </array>
            <!-- End of the Google Sign-in Section -->
        ```





