
read -p "Enter the name of the tool you want to install: " tool

if command -v $tool &> /dev/null; then
	echo "The $tool is already installed."
else 
	echo "The $tool is not installed, Installing $tool"

	if [ "$(uname)" == "Darwin" ]; then
		brew install $tool
	elif [ "$(uname)" == "Linux" ]; then
		sudo apt update
		sudo apt install -y $tool
	else 
		echo "Unsupported OS. Cannot install $tool"
	fi

	if command -v $tool &> /dev/null; then
		echo "$tool is installed successfully."
	else 
		echo "Failed to install $tool. Please check your system or package manager."
	fi
fi

echo "Installation check complete."
