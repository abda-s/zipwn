# Zipwn

**Disclaimer:** *This is for educational purposes only. Only use this for ethical stuff, like recovering your own lost files or testing your own security.* 😉

## About
Zipwn is a simple automation tool that performs a **Dictionary Attack** on password-protected archives using the 7-Zip CLI. It iterates through a provided wordlist to recover lost passwords.

## Requirements
*   **Windows:** [7-Zip](https://www.7-zip.org/) installed in default location (`C:\Program Files\7-Zip`).
*   **Linux:** `p7zip-full` installed via your package manager.

## Wordlists (The Key Ingredient)
To use this tool, you need a **wordlist**—a simple text file (`.txt`) containing a list of potential passwords, one per line.

### Where to Find Wordlists
*   **SecLists:** The most popular collection of wordlists. You can download it from [GitHub](https://github.com/danielmiessler/SecLists).
*   **RockYou:** A famous leaked password list often found on Kali Linux (`/usr/share/wordlists/rockyou.txt`).

### How to Generate Your Own
If you know specific details about the password (like length or characters used), you can generate a custom list using tools like **Crunch**.

**Example (Linux):**
Generate all 4-digit numeric pins:
```bash
crunch 4 4 0123456789 -o pins.txt
```

## How to Use

### Windows
1.  Ensure 7-Zip is installed.
2.  Run `zipwn.bat`.
3.  Enter the path to the target archive (e.g., `secret.zip`).
4.  Enter the path to your wordlist file (e.g., `rockyou.txt`).

### Linux
1.  Install dependencies (Ubuntu/Debian):
    ```bash
    sudo apt install p7zip-full
    ```
2.  Make the script executable:
    ```bash
    chmod +x zipwn.sh
    ```
3.  Run the script:
    ```bash
    ./zipwn.sh
    ```
4.  Follow the prompts to enter the archive and wordlist paths.

## Defense
To protect against this type of attack, use long, random passwords (16+ characters) that cannot be found in a dictionary.
