DIR="~/.config"

echo "Checking if config directory exists..."
if [[ -d "$DIR" ]]; then
    echo "Backing up existing config directory..."
    mv "$DIR" "$DIR.bak" 
    echo "moving new config directory..."
else
    echo "Directory does not exist, installing new config directory..."
fi

mv config "$DIR" 
echo "Installing rofi themes" 
mv ~/.local ~/.local.bak
mv local ~/.local