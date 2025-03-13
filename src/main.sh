#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 -d <directory_name> -p <parent_directory> -n <licence_name>"
    exit 1
}

# Parse command-line arguments
while getopts ":d:p:n:" opt; do
    case ${opt} in
        d ) DIR_NAME=$OPTARG ;;
        p ) PARENT_DIR=$OPTARG ;;
        n ) NAME=$OPTARG ;;
        * ) usage ;;
    esac
done

# Check if both arguments are provided
if [ -z "$DIR_NAME" ] || [ -z "$PARENT_DIR" ]; then
    usage
fi

FULL_PATH="${PARENT_DIR}${DIR_NAME}"

# Create the directory
mkdir -p "$FULL_PATH" || { echo "Failed to create directory"; exit 1; }

# Create subdirectories
mkdir -p "$FULL_PATH/src" "$FULL_PATH/data" "$FULL_PATH/config" "$FULL_PATH/tests"

# Copy root files
cp -f "../data/LICENSE" "$FULL_PATH/LICENSE"
cp -f "../data/sample_readme.md" "$FULL_PATH/README.md"
cp -f "../data/.gitignore" "$FULL_PATH/.gitignore"
cp -f "../data/pytest.ini" "$FULL_PATH/pytest.ini"

# Copy config files
cp -f "../data/logger.yaml" "$FULL_PATH/config/logger.yaml"

# copy src files
cp -f "../data/main.py" "$FULL_PATH/src/main.py"
cp -f "../data/custom_logger.py" "$FULL_PATH/src/custom_logger.py"

# copy test files
cp -f "../data/conftest.py" "$FULL_PATH/tests/conftest.py"
cp -f "../data/test_custom_logger.py" "$FULL_PATH/tests/test_custom_logger.py"

# Modify LICENSE with current year and NAME
YEAR=$(date +%Y)
echo "Project initialized in year $YEAR" > "$FULL_PATH/year_info.txt"
sed -i "3s/.*/Copyright (c) $YEAR $NAME/" "$FULL_PATH/LICENSE"

# Modify README title
sed -i "1s/.*/# $DIR_NAME/" "$FULL_PATH/README.md"

# Modify logger name
LOGGER_NAME="${DIR_NAME}_logger"
sed -i "20s/.*/    $LOGGER_NAME: /" "$FULL_PATH/config/logger.yaml"

# Move to new directory
cd "$FULL_PATH" || exit 1

# Create a Python virtual environment
python3 -m venv $DIR_NAME

# Modify .gitignore for poyhton virtual environment
printf "$DIR_NAME/*" >> "$FULL_PATH/.gitignore"

# Initialize a local Git repository
git init
git add .
git commit -m "Initial commit"