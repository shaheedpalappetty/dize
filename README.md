# Dize App

Dize is a mobile app developed using Clean Architecture and Bloc as the state management solution.

## Developer Details

- **Developer:** Shaheed Palappetty
- **Email:** palappettyshaheed@gmail.com
- **LinkedIn:** www.linkedin.com/in/shaheed-palappetty

## Features

### 1. Splash Page

The app features a splash page that displays for 3 seconds upon opening the app, followed by the main page.

### 2. Widget Tapping

On each tapping of Widget 5:

- **Widget 2:** Displays a random number between 0 - 59.
- **Widget 1:** Displays seconds from the tapped time.

### 3. Success and Failure Handling

If the random number displayed on Widget 2 equals the seconds shown by Widget 1:

- **Widget 3:** Displays a success message with a success score out of the total number of attempts.

If the random number displayed on Widget 2 does not equal the seconds shown by Widget 1:

- **Widget 3:** Displays a failure message with a failure score out of the total number of attempts.

### 4. Countdown and Penalty

On each tapping of Widget 5:

- **Widget 4:** Counter resets to 5 and starts counting down from 5 to 0 (seconds).
- If the user does not tap Widget 5 until Widget 4 counts down to 0:
  - A new failure attempt is considered.
  - **Widget 3:** Displays a failure message "Sorry! timeout, and one attempt is considered for failure as a penalty" with a failure score out of the total number of attempts.

### 5. Persistent Values

All values are retained upon closing and reopening the app.

## Technologies Used

- Clean Architecture
- Bloc State Management
- Shared Preference


