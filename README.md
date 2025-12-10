# Imgur App – iOS

Simple native **Imgur client for iOS**, written in Swift.  
This project was created as an educational / exam assignment and demonstrates how to consume the Imgur API, display image feeds, and present image details in a clean UIKit app.

![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![Language](https://img.shields.io/badge/language-Swift-orange.svg)

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
  - [1. Clone the Repository](#1-clone-the-repository)
  - [2. Open in Xcode](#2-open-in-xcode)
  - [3. Configure Imgur API Credentials](#3-configure-imgur-api-credentials)
  - [4. Run on Simulator or Device](#4-run-on-simulator-or-device)
- [Project Structure](#project-structure)
- [Known Limitations](#known-limitations)
- [Possible Improvements](#possible-improvements)
- [License](#license)
- [Contact](#contact)

---

## Overview

The **Imgur App for iOS** is a small demo application that connects to the Imgur API and displays images from Imgur in a native iOS interface.

Typical use cases:

- Browse a curated list / feed of images from Imgur  
- See image titles, descriptions, and other metadata  
- Tap an image to view more details in a separate screen  
- Basic navigation and error handling to illustrate API usage in a real app  

The focus of this project is:

- Calling a REST API from iOS  
- Parsing JSON into Swift models  
- Displaying lists with `UITableView` / `UICollectionView`  
- Navigation between list and detail screens  
- Writing basic unit tests and UI tests  

---

## Features

> The exact details depend on the final state of the code, but the app is built around these core ideas:

- 📷 **Image Feed**  
  - Load images from Imgur (gallery / search / specific endpoint)  
  - Show thumbnail, title, and other basic information  

- 🔍 **Detail View**  
  - Tap an item in the list to open a detail screen  
  - Show the full-size image, title, description, and metadata  

- 🔄 **Network Handling**  
  - Centralized networking layer for talking to the Imgur API  
  - Simple error handling and fallback messaging to the user  

- ✅ **Basic Tests**  
  - Separate targets for **unit tests** and **UI tests**  

---

## Architecture

This is a **native UIKit app written in Swift**.  

- **Xcode project**: `ImgurApp.xcodeproj`  
- **Main app target**: `ImgurApp`  
- **Testing targets**:  
  - `ImgurAppTests`  
  - `ImgurAppUITests`  

Patterns used:
- Separate **networking** code (API client, endpoints, parsing)  
- Separate **models** (Swift structs/classes representing Imgur data)  
- View controllers handle UI configuration and connect user interactions to the model/network layer  

---

## Requirements

- **macOS** with Xcode installed  
- **Xcode 12+** (or newer)  
- **iOS 13+** deployment target (check project settings)  

You also need:
- A valid **Imgur API client ID** (free from [Imgur’s developer portal](https://apidocs.imgur.com/))  

---

## Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/ferrannl/Imgur-App-iOS.git
cd Imgur-App-iOS
```

### 2. Open in Xcode
```bash
open ImgurApp.xcodeproj
```
Or open Xcode → File → Open… → select `ImgurApp.xcodeproj`.

### 3. Configure Imgur API Credentials
1. Create an Imgur application in the developer console  
2. Copy your Client-ID  
3. In the project, search for constants like:
   - `CLIENT_ID`  
   - `IMGUR_CLIENT_ID`  
   - `YOUR_IMGUR_CLIENT_ID_HERE`  
4. Replace the placeholder with your real Client-ID  

> ⚠️ Do not commit private keys or secrets to a public repository. For school purposes this may be acceptable, but in real apps you should use safer storage.

### 4. Run on Simulator or Device
1. In Xcode, choose the **ImgurApp** scheme  
2. Select an iOS simulator (e.g., iPhone 15)  
3. Press **⌘ + R** or click Run  

To run on a physical device:
- Connect your iPhone  
- Select it from the device list  
- Ensure a valid signing team is set in **Signing & Capabilities**  
- Run the app again  

---

## Project Structure

```text
Imgur-App-iOS/
├─ ImgurApp.xcodeproj       # Xcode project file
├─ ImgurApp/                # Main source code
│  ├─ AppDelegate / SceneDelegate
│  ├─ ViewControllers / Views
│  ├─ Models                # Swift structs/classes for Imgur data
│  ├─ Networking            # API client
│  └─ Assets                # Images, colors, storyboards/XIBs
├─ ImgurAppTests/           # Unit tests
├─ ImgurAppUITests/         # UI tests
├─ .gitattributes           # Git config
└─ README.md
```

---

## Known Limitations

- No persistent caching of images or API responses  
- Error handling is intentionally simple  
- No full offline support  
- Limited or no localization  
- API credentials may be hard-coded  

---

## Possible Improvements

- 🔐 Move API keys to a safer configuration mechanism  
- 💾 Add caching of images and responses (URLCache, local DB, disk cache)  
- 🌐 Add more Imgur features (search, albums, comments, favorites)  
- 🎨 Improve UI/UX (responsive layouts, dark mode support)  
- 🌍 Add localization (Dutch, English, German, etc.)  
- 🧪 Add more unit tests and UI tests for critical flows  

---

## License

No explicit open-source license file is provided in this repository.  
Treat this project as **all rights reserved** by the author (primarily for educational and personal use).  
If you want to reuse parts of this code, please contact the repository owner.

---

## Contact

**Author:** Ferran (@ferrannl on GitHub)  
**Repository:** [Imgur-App-iOS](https://github.com/ferrannl/Imgur-App-iOS)  

If you have questions, suggestions, or want to show improvements, feel free to open an issue or fork the repo.
```
