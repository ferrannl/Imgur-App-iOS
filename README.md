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

Typical use-cases:

- Browse a curated list / feed of images from Imgur.
- See image titles, descriptions and other metadata.
- Tap an image to view more details in a separate screen.
- Basic navigation and error handling to illustrate API usage in a real app.

The focus of this project is:

- Calling a REST API from iOS.
- Parsing JSON into Swift models.
- Displaying lists with `UITableView` / `UICollectionView` (depending on the implementation).
- Navigation between list and detail screens.
- Writing basic unit tests and UI tests.

---

## Features

> The exact details depend on the final state of the code, but the app is built around these core ideas:

- 📷 **Image Feed**
  - Load images from Imgur (e.g. gallery / search / a specific endpoint).
  - Show thumbnail, title and other basic information.

- 🔍 **Detail View**
  - Tap an item in the list to open a detail screen.
  - Show the full-size image (or a larger version), title, description and other metadata.

- 🔄 **Network Handling**
  - Centralized networking layer for talking to the Imgur API.
  - Simple error handling and fallback messaging to the user.

- ✅ **Basic Tests**
  - Separate targets for **unit tests** and **UI tests**.

If you plan to extend the app, you can easily plug in more Imgur endpoints (search, comments, albums, etc.).

---

## Architecture

This is a **native UIKit app written in Swift**.  
The main ideas:

- **Xcode project**: `ImgurApp.xcodeproj`
- **Main app target**: `ImgurApp`
- **Testing targets**:
  - `ImgurAppTests`
  - `ImgurAppUITests`

Common architectural patterns used in projects like this:

- Separate **networking** code (API client, endpoints, parsing).
- Separate **models** (Swift structs/classes that represent Imgur data).
- View controllers responsible for:
  - Configuring and displaying views.
  - Connecting user interactions to the model / network layer.

---

## Requirements

To build and run the app you will typically need:

- **macOS** with Xcode installed
- **Xcode 12+** (or any reasonably recent version that supports Swift and iOS targets used in this project)
- **iOS 13+** deployment target (or similar; check the project settings)

You also need:

- A valid **Imgur API client ID** (free from [Imgur’s developer portal](https://apidocs.imgur.com/)) if the app still uses live API calls.

---

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/ferrannl/Imgur-App-iOS.git
cd Imgur-App-iOS

2. Open in Xcode

Open the Xcode project:

open ImgurApp.xcodeproj

Or start Xcode and choose:

> File → Open… → select ImgurApp.xcodeproj



3. Configure Imgur API Credentials

If the app uses the Imgur API, there will usually be a place in the code where the Client-ID is defined.

Typical steps:

1. Create an Imgur application in the Imgur developer console.


2. Copy your Client-ID.


3. In the project, search for something like:

CLIENT_ID

IMGUR_CLIENT_ID

YOUR_IMGUR_CLIENT_ID_HERE



4. Replace the placeholder value with your real Imgur Client-ID.



If you cannot find a dedicated config file, search the codebase for "Client-ID" or "imgur" to locate where headers are set.

> ⚠️ Do not commit private keys or secrets to a public repository. For school purposes this may be acceptable, but in real apps you should use safer storage.



4. Run on Simulator or Device

1. In Xcode, choose the ImgurApp scheme.


2. Select an iOS simulator, e.g. iPhone 15.


3. Press ⌘ + R or click the Run button.



To run on a physical device:

Connect your iPhone.

Select it from the device list.

Make sure you use a valid signing team in Signing & Capabilities.

Run the app again.



---

Project Structure

At the repository root:

ImgurApp.xcodeproj
Xcode project file for the app and all test targets.

ImgurApp/
Main source code for the app:

AppDelegate / SceneDelegate

View controllers and views

Models for Imgur data

Networking / API client

Assets (images, colors, storyboards or XIBs, depending on the implementation)


ImgurAppTests/
Unit test target for testing models, networking and other logic.

ImgurAppUITests/
UI test target for end-to-end tests (launching the app, tapping through screens, verifying labels, etc.).

.gitattributes
Git configuration for line endings and text handling.


You can open these folders in Xcode’s project navigator to see the exact file names and organization.


---

Known Limitations

Some typical limitations for a small school project like this:

No persistent caching of images or API responses.

Error handling is intentionally simple.

No full offline support.

Limited or no localization.

Imgur API credentials might be hard-coded or use a simple configuration approach.


Feel free to improve and harden the project for production use.


---

Possible Improvements

Ideas if you want to continue working on this app:

🔐 Move API keys to a safer configuration mechanism.

💾 Add caching of images and responses (e.g. URLCache, local database, or disk cache).

🌐 Add more Imgur features:

Search

Albums

Comments

User favorites


🎨 Improve UI/UX:

Better layout for different screen sizes

Dark mode support


🌍 Add localization (e.g. Dutch, English, German).

🧪 Add more unit tests and UI tests for critical flows.



---

License

No explicit open-source license file is provided in this repository.
Treat this project as all rights reserved by the author (primarily for educational and personal use).
If you want to reuse parts of this code, please contact the owner of the repository.


---

Contact

Author: Ferran (@ferrannl on GitHub)
Repository: https://github.com/ferrannl/Imgur-App-iOS

If you have questions, suggestions or want to show improvements you made, feel free to open an issue or fork the repo.
