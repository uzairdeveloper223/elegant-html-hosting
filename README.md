# Elegant HTML Hosting Script

**Elegant HTML Hosting Script** is a versatile tool designed for generating and hosting stylish HTML pages both locally and on the internet. Whether you want to showcase your HTML files or create dynamic, eye-catching pages on the fly, this script offers a simple and efficient solution.

## Features

- **Automatic PHP Installation**: Checks if PHP is installed and installs it automatically if needed, supporting both Termux and Kali Linux environments.
- **Host Your Own HTML Files**: Easily host any HTML file on your local machine by specifying the file name and port.
- **Generate Stylish HTML Pages**: Dynamically create a stylish HTML page with a user-defined word and host it locally.
- **Internet Hosting**: Option to make your locally hosted HTML pages accessible from anywhere using `localhost.run`.
- **User-Friendly Interface**: Step-by-step prompts guide you through the process, making it easy to use.

## How to Use

### Prerequisites

- Terminal environment with Bash support (e.g., Termux, Kali Linux).
- Internet connection (for initial PHP installation and internet hosting).

### Running the Script

1. **Clone the Repository**:
   ```
git clone https://github.com/uzairdeveloper223/elegant-html-hosting-script.git
   cd elegant-html-hosting
   ```

2. **Make the Script Executable**:
   ```
chmod +x elegant-html-hosting.sh
   ```

3. **Run the Script**:
   ```
./elegant-html-hosting.sh
   ```

4. **Follow the Prompts**:
   - Choose to host your own file or create a stylish demo HTML page.
   - If hosting your own file, provide the file name and port.
   - If creating a demo, enter a word to be displayed on the generated page.
   - After local hosting, choose whether to make the page accessible on the internet to host any file on internet do only for once which is shown down below.

### Guide to host on Internet only once.
Run this command and enter , enter and enter three times or four.
```
ssh-keygen
```

## Example Usage

### Host Your Own File

```
Do you want to host your own file (y/n)? y
Enter the name of the file you want to host (e.g., index.html): mypage.html
Enter the port number you want to use for hosting: 8080
Your file mypage.html is now hosted on http://localhost:8080.
Do you want to host it on the internet (y/n)? y
Hosting on the internet...
```

### Generate and Host a Demo HTML Page

```
Do you want to host your own file (y/n)? n
Enter the word you want to display on the demo HTML page: HelloWorld
Demo HTML file created successfully!
Your demo HTML page is now hosted on http://localhost:2525.
Do you want to host it on the internet (y/n)? n
Local hosting will continue. Use Ctrl + C to stop the server.
```

## Acknowledgments

This script was created by **UZAIRxDEV223** with the assistance of **ChatGPT**. Special thanks to ChatGPT for providing valuable guidance throughout the development process. 😄

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Contributions are welcome! Feel free to submit issues or pull requests. Enjoy using the Elegant HTML Hosting Script!

