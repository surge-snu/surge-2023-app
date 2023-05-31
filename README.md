# SURGE 2023 APP

## Flutter Project Setup

This document provides guidelines on setting up a Flutter project and following naming conventions for branches and commit messages.

## Setup

1. Install Flutter by following the official [Flutter installation guide](https://flutter.dev/docs/get-started/install).
2. Clone the project repository using Git:
```bash 
git clone <repository_url>
```
3. Navigate to the project directory:
```bash
cd <project_directory>
```
4. Fetch the Flutter dependencies:
```dart
flutter pub get
```
5. Run the Flutter project:
```dart
flutter run
```


## Branch Naming Convention

When creating a new branch for a feature, bug fix, or any other development task, follow this naming convention:

```bash
<type>/<short_description>
```

- `<type>`: The type of the task (e.g., feature, bug, hotfix, refactor, etc.).
- `<short_description>`: A brief description of the task, using hyphens (-) to separate words.

Examples:
- `feature/user-login`
- `bug/homepage-crash`
- `refactor/database-utils`

## Commit Message Format

For commit messages, follow this format:

```bash
<type>: <subject>
```

- `<type>`: The type of the commit (e.g., feat, fix, docs, refactor, chore, etc.).
- `<subject>`: A brief description of the change in the commit.

Examples:
- `feat: Add user authentication`
- `fix: Fix null pointer exception in homepage`
- `docs: Update README with project setup instructions`

## Naming Conventions in Flutter

- Use camelCase for variable and function names (e.g., `userName`, `fetchData()`).
- Use PascalCase for class and enum names (e.g., `UserModel`, `UserRole`).
- Use snake_case for file names (e.g., `user_service.dart`, `home_screen.dart`).
- Use uppercase with underscore for constant names (e.g., `API_BASE_URL`, `DEFAULT_TIMEOUT`).

For more details on Flutter coding style and conventions, refer to the official [Flutter style guide](https://flutter.dev/docs/development/tools/formatting).
