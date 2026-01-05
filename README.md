# Found Phone Template For Godot 🚧 WORK IN PROGRESS 🚧

![Godot 4](https://img.shields.io/badge/Godot-v4.x-%23478cbf?logo=godot-engine&logoColor=white)
![Status](https://img.shields.io/badge/Status-In%20Development-orange)
![License](https://img.shields.io/badge/License-MIT-green)

<p align="center">
  <img src="https://github.com/user-attachments/assets/0de0fd0b-26b1-48bb-be32-7c37c1c98e1e" alt="Home Screen" width="30%">
  <img src="https://github.com/user-attachments/assets/2540a4b4-1de2-4fc2-a4bb-8f9f813b9ab3" alt="Chat UI" width="30%">
  <img src="https://github.com/user-attachments/assets/2652e201-e6cf-4250-bf5a-7a66f3a83fed" alt="Gallery UI" width="30%"/>
</p>

An open-source template designed to create narrative "Found Phone" games (similar to *Simulacra*, *A Normal Lost Phone*, or *Duskwood*) using **Godot Engine 4**.

The project is currently in early development. The focus is on building the core logic for standard apps first. Future updates will focus on UI polishing and optimizing the content creation workflow for ease of use.

## Key Features

- **Responsive UI:** Adapts to different aspect ratios.
- **Realtime Clock:** Use the player's local time for the game.
- **Resource-Based Storytelling:** Create conversations using `Custom Resources` (`.tres` files). No hardcoded strings.
- **Multimedia Support:** Send and receive images and audio messages (voice notes) with playback controls.
- **Branching Narrative:** Support for player choices that dynamically alter the conversation flow.
- **Linked List Logic:** Messages can trigger subsequent messages automatically or wait for player input.

## 🗺️ Roadmap

- [x] Core OS UI & Notch Handling
- [x] Chat App (Reading & Branching Choices)
- [x] Chat App (Images & Audio support)
- [x] Photo Gallery App
- [ ] Incoming Call System
- [ ] Web Browser Simulation
- [ ] Notification System

## 🚀 Getting Started

>Note: This workflow is experimental and will likely change as the template evolves.

### How to Create a Conversation
The template uses a data-driven approach. You don't need to touch the scripts to add content.

1. **Create a Message:**
   - Right-click in FileSystem -> `New Resource` -> `MessageData`.
   - Set the content (text/audio/image), sender (ME/OTHER), and delay.
   
2. **Add Choices (Optional):**
   - In the `Reply Options` array of a message, create new `ReplyOption` resources.
   - Link them to the *next* `MessageData` file to create branching paths.

3. **Create the Chat:**
   - Create a new `ChatData` resource.
   - Drag and drop your initial messages into the conversation array.

4. **Run:** The system automatically loads `ChatData` files from the `GameContent/Data_Chats` folder and populates the contact list.

## 📂 Project Structure

- `_Assets/`: Images, Fonts, and Icons for the system OS.
- `_System/`: Contains the system logic (Scripts, Base Scenes, System definitions). **Don't touch this if you are just writing the story.**
- `Apps/`: Individual simulated applications (Chat, Gallery, Settings). You can create new apps and simply link them to an icon in the HomeApp.
- `GameContent/`: **Your Playground.**
  - `Assets/`: Story-specific assets like Images or Audios.
  - `Data/`: `.tres` resources like `ChatData`, `MessageData` or `PhotoData`

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
