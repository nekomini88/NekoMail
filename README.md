# NekoMail

A lightweight Android WebView wrapper for Roundcube Webmail.

## Features
- 🚀 Fast and lightweight WebView implementation.
- ⚙️ Configurable email domain.
- 📱 Full-screen responsive layout.
- 🛠️ Automated builds via GitHub Actions.

## Configuration
The target email domain is configured in `domain.properties`:
```properties
email_domain=mail.nekomini.dpdns.org
```

## Build and Deploy
This project uses GitHub Actions for automated builds.

### Local Build
1. Install Android SDK and Gradle.
2. Run:
   ```bash
   gradle assembleDebug
   ```
3. The APK will be located at: `app/build/outputs/apk/debug/NekoMail.apk`

### Automatic Release
1. Push changes to `main` branch to trigger debug APK build.
2. Push a tag (e.g., `git tag v1.2 && git push origin v1.2`) to create a GitHub Release with the APK.

## License
MIT