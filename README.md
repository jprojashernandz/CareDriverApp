# Project Name

## Table of Contents
- [Overview](#overview)
- [Build and Run Instructions](#build-and-run-instructions)
- [Architecture & Technical Decisions](#architecture--technical-decisions)
- [Third-Party Libraries](#third-party-libraries)
- [AI Tools Disclosure](#ai-tools-disclosure)

---

## Overview

Native mobile application for iOS (Swift/SwiftUI) that allows a driver to see a list of available rides, sorted by the mostprofitable first.
The application:
1. Fetches a list of available rides for a specific driver
2. Displays the rides in a list, sorted in descending order by score.
3. Each item in the list is easy to read and displays:
  - The start and destination addresses.
  - The estimated ride earnings.
  - The ride's score.

## Build and Run Instructions

1. **Clone the repository:**
    ```bash
    git clone https://github.com/jprojashernandz/CareDriverApp.git
    cd CareDriverApp
    ```

2. **Open the project in Xcode:**
    - Double-click the `.xcodeproj` file to open the project in Xcode.

3. **Select a simulator or device and click the Run (▶️) button in Xcode.**

---

## Architecture & Technical Decisions

- **Architecture Pattern:**  
  The project uses the **MVVM (Model-View-ViewModel)** pattern. Views are built with SwiftUI, and business logic/state management is handled by dedicated ViewModels. This separation improves testability, code organization, and reusability.

- **SwiftUI:**  
  Chosen for its modern, declarative UI development style, seamless integration with MVVM, and native support for Apple platforms.

- **Other Technical Decisions:**  
  - All models are structs for value semantics and immutability.
  - State management leverages `@State`, `@ObservedObject`, and `@EnvironmentObject` as appropriate.
  - Dependency injection is used for ViewModels to facilitate testing and modularity.

---

## Third-Party Libraries
No third-party libraries are used in the project.

---

## AI Tools Disclosure

This project made use of the following AI tools:

- **GitHub Copilot and ChatGPT / GPT-4:** Used for:
  - Code completion, UI suggestions, and documentation.
  - Assisted in generating code snippets, SwiftUI best practices, and drafting documentation.

---