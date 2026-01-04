# Contribution Guide

Thank you for your interest in contributing!

This project is Open Source, and any help—from fixing a small typo to implementing a whole new app—is welcome. However, since we are in an early development stage, we have established a few rules to keep chaos under control.

## Reporting Bugs

If you find an error, please open an **Issue** on GitHub before trying to fix it. Please include:
1. What you were trying to do.
2. What happened (screenshots or GIFs are very helpful).
3. Steps to reproduce it.
4. Your Godot version.

## ⚠️ Golden Rules for Godot (Read Me!)

Collaborating in Godot comes with one major risk: **Conflicts in `.tscn` files**.

1. **Avoid modifying large scenes (`.tscn`) unless strictly necessary.**
   - If two people modify the `HomeApp.tscn` scene at the same time, GitHub will generate a merge conflict that is very difficult to fix manually.
   - **Solution:** Try to make changes only in the scripts (`.gd`) whenever possible.
   - If you are adding new visual functionality, try to create it in a separate **New Scene**

2. **Do not upload temporary files.**
   - Make sure your `.gitignore` is working. Never upload the `.godot/` folder or export folders.

## Code Style (GDScript)

To keep the code clean and readable, we follow the [Official Godot Style Guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html).

### 1. Static Typing
Static typing is **highly recommended** to avoid bugs and improve autocompletion.

* ❌ **No:**
    ```gdscript
    func add(a, b):
        return a + b
    ```
* ✅ **Yes:**
    ```gdscript
    func add(a: int, b: int) -> int:
        return a + b
    ```

### 2. Naming Conventions
* Classes and Nodes: `PascalCase` (e.g., `MessageData`, `HomeApp`).
* Variables and Functions: `snake_case` (e.g., `current_message`, `load_chat_data()`).
* Constants: `SCREAMING_SNAKE_CASE` (e.g., `MAX_MESSAGE_LENGTH`).

## Pull Request (PR) Process

1.  **Fork** the repository.
2.  Create a branch for your feature: `git checkout -b feature/new-gallery-app`.
3.  Make your changes.
4.  Test that the game runs without errors in the console.
5.  Push to your branch.
6.  Open a Pull Request targeting the `main` branch.
    - In the description, explain **what** you changed and **why**.

---

Thanks for helping us build the best tool for narrative games in Godot!
