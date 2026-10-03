# Number Guessing Game

An interactive, C-based game where players test their logic by guessing a secret number within a customizable range. The game provides real-time feedback after each attempt to help you narrow down the answer in as few turns as possible.

## Features

* **Custom Range Selection:** Set your own numerical range (e.g., 1 to 100) before starting.
* **Real-Time Feedback:** Get instant hints after every turn indicating whether the secret number is higher or lower than your guess.
* **Attempt Tracking:** Challenge yourself to guess the correct number within a limited number of attempts.
* **Simple & Lightweight:** Written in clean C code for fast execution.

## How to Play

1. **Set the Range:** Define the minimum and maximum boundaries for the secret number (e.g., 1–100).
2. **Make a Guess:** Enter your predicted number within the specified range.
3. **Receive Hints:**
   * **"Number is lower"** — Your guess is higher than the secret number.
   * **"Number is higher"** — Your guess is lower than the secret number.
   * **"Good job"** — You guessed the correct number!
4. **Win the Game:** Guess the correct number before running out of allowed attempts.

## Getting Started

### Prerequisites

* Any standard C compiler (GCC, Clang, MSVC, etc.) installed on your machine.

### Compilation & Execution

Run the following commands in your terminal:

```bash
# 1. Clone the repository
git clone [https://github.com/Yousuf-Idrees/Computer_Architecture_Project.git](https://github.com/Yousuf-Idrees/Computer_Architecture_Project.git)
cd Computer_Architecture_Project

# 2. Compile the source code
gcc main.c -o guessing_game

# 3. Run the executable
./guessing_game
