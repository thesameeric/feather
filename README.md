# Mechanical Keyboard Sound Simulator

A Swift application that simulates mechanical keyboard sounds for Mac. This app adds satisfying mechanical keyboard feedback to your typing experience. This is an adaptation from https://kbs.im.

## Features

- Multiple keyboard sound profiles
- Adjustable volume control
- Support for different key types:
  - Regular keys (with random variations)
  - Space bar
  - Enter key
  - Backspace
- Separate sounds for key press and release
- Non-intrusive background operation

## Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/keyboard-sound-simulator.git
```

2. Open the project in Xcode
3. Build and run the application

## Installation

### Using Homebrew
```bash
# Add the tap
brew tap yourusername/tap

# Install Feather
brew install --cask feather
```

## Running the Application
### Method 1: Running from Xcode

Open the project in Xcode
Select your target device (Mac)
Click the Run button (▶️) or press Cmd + R

### Method 2: Running the Built Application

Build the application in Xcode (Product -> Build)
Navigate to the built application in Finder
Double-click to launch
The app will appear in your menu bar
Click the menu bar icon to:

Adjust volume
Switch sound profiles
Access preferences
Quit the application



First Run

When first launching the app, you may need to:

Grant accessibility permissions in System Preferences
Allow the app to run at startup (optional)
Configure your preferred sound profile



Troubleshooting

If no sound plays:

Check system sound settings
Verify accessibility permissions
Ensure sound files are properly installed


If the app doesn't start:

Check console logs for errors
Verify all required files are present

## Sound Files Structure

The application expects sound files to be organized in the following structure:
```
Sounds/
├── profile_name/
│   ├── press/
│   │   ├── BACKSPACE.mp3
│   │   ├── ENTER.mp3
│   │   ├── SPACE.mp3
│   │   ├── GENERICR0.mp3
│   │   ├── GENERICR1.mp3
│   │   ├── GENERICR2.mp3
│   │   ├── GENERICR3.mp3
│   │   └── GENERICR4.mp3
│   └── release/
│       ├── BACKSPACE.mp3
│       ├── ENTER.mp3
│       ├── SPACE.mp3
│       └── GENERIC.mp3
```

## Development

### Requirements
- macOS 11.0+
- Xcode 13.0+
- Swift 5.0+

### Key Components
- `SoundManager`: Handles sound loading and playback
- `KeySounds`: Manages sound resources and paths
- Core functionality uses `AVFoundation` for audio playback

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Sound samples sourced from [source_name]
- Inspired by mechanical keyboard enthusiasts
```

Would you like me to modify or add any specific sections to the README?
