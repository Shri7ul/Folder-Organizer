# 📂 Folder Organizer

A lightweight Windows batch script that automatically organizes files into folders based on their file extensions.

No installation, Python, Node.js, or external dependencies are required.

Just place `start.bat` inside a folder and run it.

---

## ✨ Features

* Automatically creates category folders
* Organizes files by extension
* Works in **any folder**
* No installation required
* No external dependencies
* Skips the organizer script itself
* Skips incomplete temporary download files
* Places unsupported file types into `Others`
* Prevents overwriting existing files
* Can be stored on GitHub and reused whenever needed

---

## 📁 Supported Categories

| Category   | Extensions                                                                                                                              |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| Videos     | `.mp4`, `.mkv`, `.avi`, `.mov`, `.wmv`, `.flv`, `.webm`, `.3gp`, `.m4v`                                                                 |
| Photos     | `.jpg`, `.jpeg`, `.png`, `.gif`, `.bmp`, `.webp`, `.heic`, `.svg`, `.ico`                                                               |
| Documents  | `.pdf`, `.doc`, `.docx`, `.xls`, `.xlsx`, `.csv`, `.ppt`, `.pptx`, `.odt`, `.ods`, `.odp`                                               |
| Text Files | `.txt`, `.md`, `.log`, `.rtf`                                                                                                           |
| Music      | `.mp3`, `.wav`, `.aac`, `.flac`, `.m4a`, `.ogg`, `.wma`                                                                                 |
| Archives   | `.zip`, `.rar`, `.7z`, `.tar`, `.gz`, `.bz2`, `.xz`                                                                                     |
| Apps       | `.exe`, `.msi`, `.apk`                                                                                                                  |
| Code       | `.py`, `.js`, `.ts`, `.jsx`, `.tsx`, `.java`, `.c`, `.cpp`, `.h`, `.hpp`, `.cs`, `.go`, `.rs`, `.php`, `.html`, `.css`, `.json`, `.xml` |
| Fonts      | `.ttf`, `.otf`, `.woff`, `.woff2`                                                                                                       |
| Torrents   | `.torrent`                                                                                                                              |
| Others     | All unsupported file types                                                                                                              |

---

## 🚀 How to Use

### Method 1 — Download from GitHub

Download `start.bat` from this repository.

Place it inside the folder you want to organize.

For example:

```text
Downloads/
├── start.bat
├── movie.mp4
├── song.mp3
├── photo.jpg
├── report.pdf
├── archive.zip
└── random.xyz
```

Double-click:

```text
start.bat
```

The folder will automatically become:

```text
Downloads/
├── start.bat
│
├── Videos/
│   └── movie.mp4
│
├── Music/
│   └── song.mp3
│
├── Photos/
│   └── photo.jpg
│
├── Documents/
│   └── report.pdf
│
├── Archives/
│   └── archive.zip
│
└── Others/
    └── random.xyz
```

---

## 🧠 How It Works

The script determines its own location using:

```bat
cd /d "%~dp0"
```

`%~dp0` represents the directory where the `.bat` file is located.

Therefore, the script does **not** depend on a hard-coded path such as:

```text
C:\Users\Username\Downloads
```

Instead, wherever `start.bat` is placed becomes the target directory.

### Example

If the script is here:

```text
D:\Downloads\start.bat
```

it organizes:

```text
D:\Downloads\
```

If the script is here:

```text
C:\Users\User\Desktop\Test\start.bat
```

it organizes:

```text
C:\Users\User\Desktop\Test\
```

---

## ⚠️ Important Behavior

### 1. Only the current folder is organized

The script processes files directly inside the folder containing `start.bat`.

It does **not recursively scan subfolders**.

For example:

```text
Downloads/
├── movie.mp4       ← Organized
├── song.mp3        ← Organized
│
└── Old/
    └── video.mp4   ← NOT touched
```

This is intentional to avoid unexpectedly modifying existing folder structures.

---

### 2. Existing folders are preserved

If a category folder already exists, the script uses it.

For example:

```text
Downloads/
├── Videos/
├── Photos/
└── start.bat
```

The script will not delete or recreate those folders.

---

### 3. Existing files are not overwritten

Before moving a file, the script checks whether a file with the same name already exists in the destination.

Example:

```text
Videos/
└── movie.mp4
```

If another `movie.mp4` is found, the existing file will not be overwritten.

---

### 4. Temporary download files are skipped

The following extensions are intentionally ignored:

```text
.crdownload
.part
.tmp
```

This prevents partially downloaded files from being moved.

For example:

```text
Ubuntu.iso.crdownload
```

will remain in the main folder.

---

### 5. The script itself is not moved

`start.bat` remains in the folder.

---

## 🛠️ Customizing Categories

You can add more extensions easily.

For example, to create a `3D Models` folder:

```bat
call :MOVE_FILES "3D Models" obj fbx stl glb gltf blend
```

To add Photoshop files:

```bat
call :MOVE_FILES "Design" psd ai eps xd fig
```

To add datasets:

```bat
call :MOVE_FILES "Datasets" csv parquet json
```

However, note that `.csv` and `.json` are already included in other categories in the default configuration.

If an extension appears in multiple categories, the **first matching category wins**.

---

## 🔧 Custom Example

You can modify this section:

```bat
call :MOVE_FILES "Videos" mp4 mkv avi mov
call :MOVE_FILES "Photos" jpg jpeg png
call :MOVE_FILES "Documents" pdf doc docx
```

For example:

```bat
call :MOVE_FILES "Videos" mp4 mkv avi mov
call :MOVE_FILES "Photos" jpg jpeg png
call :MOVE_FILES "Documents" pdf doc docx
call :MOVE_FILES "Datasets" csv parquet
call :MOVE_FILES "Machine Learning" pkl joblib
call :MOVE_FILES "3D Models" obj fbx stl glb
```

---

## 🔒 Safety

This script uses `move`, not `del`.

It does **not intentionally delete files**.

It also checks for an existing destination file before moving.

However, moving files changes the folder structure. Always understand the script before running it on important directories.

For critical data, keep a backup.

---

## 💻 Requirements

### Operating System

Windows 7 or newer.

Tested conceptually with standard Windows Command Prompt / batch functionality.

### Dependencies

None.

You do **not** need:

* Python
* Node.js
* PowerShell modules
* Git
* Java
* .NET
* Internet connection

---

## 📦 Repository Structure

Recommended GitHub repository:

```text
Folder-organizer/
│
├── start.bat
├── README.md
└── LICENSE
```

The minimum required files are:

```text
start.bat
README.md
```

---

## ▶️ Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/Shri7ul/Folder-Organizer.git
```

### 2. Open the repository

```bash
cd Folder-organizer
```

### 3. Copy `start.bat`

Copy the file into the folder you want to organize.

### 4. Run it

Double-click:

```text
start.bat
```

That's it.

---

## 📝 Example

Before:

```text
MyFolder/
├── report.pdf
├── vacation.jpg
├── song.mp3
├── movie.mp4
├── backup.zip
├── setup.exe
├── notes.txt
├── unknown.xyz
└── start.bat
```

After:

```text
MyFolder/
├── start.bat
│
├── Documents/
│   └── report.pdf
│
├── Photos/
│   └── vacation.jpg
│
├── Music/
│   └── song.mp3
│
├── Videos/
│   └── movie.mp4
│
├── Archives/
│   └── backup.zip
│
├── Apps/
│   └── setup.exe
│
├── Text Files/
│   └── notes.txt
│
└── Others/
    └── unknown.xyz
```

---

## 🧩 Why Use a Batch Script?

For this particular task, a Windows batch script is sufficient.

The operation is simple:

```text
Read files
   ↓
Check extension
   ↓
Determine category
   ↓
Create category folder
   ↓
Move file
```

Using Python or another runtime would introduce unnecessary dependencies for a basic Windows file-organizing task.

---

## 📜 License

MIT License

You are free to use, modify, and redistribute this project.

---

## ⭐ Contributing

Suggestions and improvements are welcome.

Possible future features:

* Recursive folder organization
* Configurable categories
* Dry-run mode
* Duplicate detection
* File-size based organization
* Date-based organization
* Logging
* GUI interface
* Undo functionality
* PowerShell version
* Python version
* Configuration file support

---

## ⚠️ Disclaimer

This script moves files automatically.

Although it avoids overwriting existing destination files and skips common temporary download files, you should test it on a non-critical folder before using it on important data.
